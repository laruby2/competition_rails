class PhoneNumbersController < ApplicationController

  # post request to twilio
  def verify
    telephone = params[:phone_number]

    r = /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\z/
    m = r.match(params[:phone_number])
    if m.present? && m.length == 4
      telephone = "+1#{m[1]}#{m[2]}#{m[3]}" # E.164 format
    end

    response = client.lookups.v1.phone_numbers(telephone).fetch
    valid_num = response.phone_number # if invalid, throws an exception

    verification = client
                   .verify
                   .v2
                   .services(service_sid)
                   .verifications
                   .create(
                     to: valid_num,
                     channel: 'sms'
                   )

    # go to passcode form after posting twilio
    if verification.status == 'pending'
      session[:telephone] = telephone
      redirect_to phone_numbers_passcode_url
    else
      flash.now[:alert] = "Verification did not process"
      render :new, status: :unprocessable_entity
    end
  rescue => e
    if e.code == 20404
      flash.now[:alert] = "Not a valid phone number"
      render :new, status: :unprocessable_entity
    else
      raise e
    end
  end

  def passcode_enter
    verification_check = client
                         .verify
                         .v2
                         .services(service_sid)
                         .verification_checks
                         .create(
                           to: session[:telephone],
                           code: params[:passcode]
                         )

    # go back to user siginup page when successful
    if verification_check.status == 'approved'

      redirect_to register_url, notice: "Phone number is verified"
    else
      flash.now[:alert] = "Passcode is not being approved"
      render :edit, status: :unprocessable_entity
    end
  rescue => e
    if e.code == 20404
      flash.now[:alert] = "Not a valid passcode"
      render :edit, status: :unprocessable_entity
    else
      raise e
    end
  end

  def edit
  end

  def new
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(account_sid, auth_token)
  end

  def account_sid
    ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    ENV['TWILIO_AUTH_TOKEN']
  end

  def service_sid
    ENV['TWILIO_SERVICE_SID']
  end
end
