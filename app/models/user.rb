class User
  def initialize(email)
    @email = email
  end

  def tasks
    Task.where(email: @email)
  end

  def signed_in?
    @email.present?
  end
end
