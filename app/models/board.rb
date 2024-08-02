class Board < ApplicationRecord
  include BoardMethods

  belongs_to :user
  has_many :contexts, dependent: :destroy
  has_many :tasks , through: :contexts

  validates :name, :description, :user_id, presence: true

end
