class AvailablilityValidator < ActiveModel::Validator
  def validate(record)
    lDuration = Lesson.find(record.lesson_id).duration

    availability =  Availability.where("duration >= ?", lDuration)[0]
    unless availability
      record.errors.add :name, "Currently there is no available teacher, Try again later"
    end
  end
end

class Session < ApplicationRecord
  belongs_to :teacher
  belongs_to :lesson
  belongs_to :student
  validates_with AvailablilityValidator
end
