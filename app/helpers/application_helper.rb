module ApplicationHelper
  def class_name_by_tab(path)
    if current_page?(path)
      return "bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
    end
    "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
  end
end
