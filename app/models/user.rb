class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def tasks
    Task.where(email: email)
  end

  def signed_in?
    @email.present?
  end
end
