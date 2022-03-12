class Student < ApplicationRecord
  has_many :sessions, dependent: :destroy
end
