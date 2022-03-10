class Lesson < ApplicationRecord
  has_many :sessions, dependent: :destroy, inverse_of: :lesson
  validates :name, :duration, presence: true
  validates :name, length: { minimum: 2 }
  validates :duration, presence: true
end
