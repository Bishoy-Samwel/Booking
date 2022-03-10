class Lesson < ApplicationRecord
  has_many :sessions, dependent: :destroy
end
