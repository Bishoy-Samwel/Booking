class Teacher < ApplicationRecord
  has_many :availabilities, dependent: :destroy
  has_many :sessions, dependent: :destroy
end
