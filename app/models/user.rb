class User < ApplicationRecord
  include HasDefaultBoards
  
  after_create :update_api_key

  has_secure_password
  # has_many :tasks
  has_many :boards, dependent: :destroy
  has_many :contexts, through: :boards, dependent: :destroy
  has_many :tasks, through: :contexts, dependent: :destroy

  enum active: { inactive: 0, active: 1 }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def update_api_key
    self.update(api_key: SecureRandom.urlsafe_base64)
  end
end
