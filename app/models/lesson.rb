class Lesson < ApplicationRecord
  has_many :sessions, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
end
