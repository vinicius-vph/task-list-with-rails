module SessionButtonHelper
  def login_logout_button
    if can_show_signout?
      button_to I18n.t('logout_button'), logout_path, method: :delete, class: 'btn-auth bg-blue-200'
    else
      link_to I18n.t('login_button'), login_path, class: 'btn-auth bg-blue-200'
    end
  end

  def button_back button_text, path, options = {}
    content_tag :a, href: (path || request.env["HTTP_REFERER"] || root_path), class:"btn-back mt-2 ml-2" do
      image_tag 'arrow-left-solid.svg', class: 'btn-svg'
    end
  end
end