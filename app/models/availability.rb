class DatesValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time.after?(record.end_time)
      record.errors.add :base, "end_time should be after start_time"
    end

    if (record.end_time - record.start_time)/(60*60) > 24
      record.errors.add :base, "Duration should be lower than 24 hours"
    end

    if Availability.where("start_time >= :start_date AND end_time <= :end_date",{start_date: record.start_time, end_date:  record.end_time})[0]
      record.errors.add :base, "There is a confliction with previous records."
    end

    if Availability.where("start_time >= :start_date or end_time <= :end_date",{start_date: DateTime.current(), end_date:  DateTime.current()})[0]
      record.errors.add :base, "The time slots are from the past."
    end
  end
end

class Availability < ApplicationRecord
  belongs_to :teacher
  validates :start_time, :end_time, uniqueness: true
  validates_with DatesValidator
end

