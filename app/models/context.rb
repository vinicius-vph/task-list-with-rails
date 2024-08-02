class Context < ApplicationRecord
  belongs_to :board
  has_many :tasks
  has_many :users, through: :board

  validates :name, presence: true
  validates :description, presence: true
  validates :priority, presence: true
  validates :board_id, presence: true
  validates :priority, numericality: { only_integer: true, greater_than: 0 }
  validates_uniqueness_of :name, :priority, scope: :board_id
end
