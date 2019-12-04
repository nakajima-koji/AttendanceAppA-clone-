class AttendanceSystem < ApplicationRecord
  belongs_to :user
  
  validates :note, length: { maximum: 50 }
  validates :worked_on, presence: true
  
  validate :finish_at_is_invalid_without_a_started_at
  validate :started_at_than_finished_at_fast_if_invalid
  
  def finish_at_is_invalid_without_a_started_at
    error.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end
  
  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      error.add(:started_at, "より早い退勤時間は無効です。") if started_at > finished_at
    end
  end
end
