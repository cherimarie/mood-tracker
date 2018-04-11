class Occurance < ApplicationRecord
  belongs_to :event
  validates_associated :event
  validates :at, :event_id, presence: true

  validate :severity_in_range, :reasonable_timestamp

  # Severity must be between -10 and 10, but not 0 if event type is 'mood'; must be 0 if event type is 'activity'
  # REVIEW: There must be a less complex way to handle this logic
  def severity_in_range
    if event == nil
      # event is required, will fail validation elsewhere
      return
    end

    if event.category == 'activity'
      if severity != 0 && severity != nil
        errors.add(:severity, "must be zero for activity events")
      end
      return
    end

    if severity == 0 || severity == nil
      errors.add(:severity, "cannot be zero for mood events")
      return
    end

    if severity < -10 || severity > 10
      errors.add(:severity, "must be between -10 and 10")
    end
  end

  # When is a unix timestamp, must be within reasonable ranges
  def reasonable_timestamp
    past = 1.year.ago.to_time.to_i
    future = 1.week.from_now.to_time.to_i
    if at == nil
      errors.add(:at, "is required")
      return
    end

    if at > future || at < past
      errors.add(:at, "must be less than a year in the past, no more than a week in the future")
    end
  end

end
