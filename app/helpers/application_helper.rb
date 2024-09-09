module ApplicationHelper
  def flash_msg
    flash_success if flash[:success]
    flash_error if flash[:error]
  end

  def flash_success
    content_tag(:div, class: "absolute flex items-center justify-center w-4/5 mt-16 mb-10 mx-[10%] h-10 text-sm text-steel rounded bg-green-100") do
      concat(flash[:success])
      concat(button_to 'X', '#', id: 'close-flash', class: 'ml-2 px-1 py-1 text-[14px] font-medium text-green-900 border rounded-full', remote: true)
    end
  end

  def flash_error
    content_tag(:div, class: "absolute flex items-center justify-center w-4/5 mt-16 mb-10 mx-[10%] h-10 text-sm text-steel rounded bg-red-100") do
      concat(flash[:error])
      concat(button_to 'X', '#', id: 'close-flash', class: 'ml-2 px-1 py-1 text-[14px] font-medium text-red-900 border rounded-full rigth-0', remote: true)
    end
  end
end

# content_tag(:div, flash[:success], class: "absolute flex items-center justify-center w-4/5 mt-16 mb-10 mx-[10%] h-10 text-steel rounded bg-green-200 ")
