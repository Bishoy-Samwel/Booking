class DatesValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time >= record.end_time
      record.errors.add :base, "end_time should be after start_time"
    end
  end
end

class Availability < ApplicationRecord
  belongs_to :teacher
  validates :start_time, :end_time, uniqueness: true
  validates_with DatesValidator
end

