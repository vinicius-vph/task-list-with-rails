module SessionHelper
  def can_show_signout?
    current_user.present? && !(params[:controller].eql?('sessions') && params[:action].eql?('new'))
  end
end
