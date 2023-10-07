module ApplicationHelper
  def class_name_by_tab(path)
    if current_page?(path)
      return "bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
    end
    "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
  end

  def user_s_own_rounds(rounds)
    length = rounds.length
    sentence = []
    sentence << "You own"
    rounds.each_with_index do |round, index|
      link = link_to("“#{round.title}”", round_path(round.another_id))
      comma = index < length - 2 ? ',' : ''
      and_at_the_end = index == length - 2 ? ' and' : ''
      sentence.push [link, comma, and_at_the_end].join
    end
    sentence << "round."
    sentence.join(' ').html_safe
  end
end
