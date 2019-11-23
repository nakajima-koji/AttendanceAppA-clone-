class AttendanceSystem < ApplicationRecord
  belongs_to :user
  
  validates :note, length: { maximum: 50 }
  validates :worked_on, presence: true
  
  validate :finish_at_is_invalid_without_a_started_at
  
  def finish_at_is_invalid_without_a_started_at
    error.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end
end
