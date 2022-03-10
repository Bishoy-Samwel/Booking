class DatesValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time >= record.end_time
      record.errors.add :base, "end_time should be after start_time"
    end
    if (record.end_time - record.start_time)/(60*60) > 24
      record.errors.add :base, "Duration should be lower than 24 hours"
    end
  end
end

class Availability < ApplicationRecord
  belongs_to :teacher
  validates :start_time, :end_time, uniqueness: true
  validates_with DatesValidator
end

