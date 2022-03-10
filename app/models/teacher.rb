class Teacher < ApplicationRecord
  has_many :availabilities, dependent: :destroy
end
