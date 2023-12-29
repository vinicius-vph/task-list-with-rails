module ApplicationHelper
  def flash_msg
    flash_success if flash[:success]
    flash_error if flash[:error]
  end

  def flash_success
    content_tag(:div, flash[:success], class: "w-4/5 mt-2 mb-10 mx-auto h-10 rounded flex items-center justify-center text-steel bg-green-200 ")
  end

  def flash_error
    content_tag(:div, flash[:error], class: "w-4/5 mt-2 mb-10 mx-auto h-10 rounded flex items-center justify-center text-steel bg-red-200")
  end
end
