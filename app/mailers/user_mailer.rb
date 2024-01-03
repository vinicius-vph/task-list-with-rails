class UserMailer < ActionMailer::Base
  default from: <%= ENV.fetch('DEFAULT_SENDER') { 'No-reply@example.com' } %>

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end