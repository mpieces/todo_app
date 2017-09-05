class Task < ApplicationRecord
  validates :name, :description, :deadline_date, presence: true
  validates :description, length: { maximum: 50 }
  # validates :completed_at, allow_nil: true

  def pretty_completed_at
    completed_at.try(:strftime, "%m/%d/%y")
  end

  def pretty_deadline_date
    deadline_date.try(:strftime, "%m/%d/%y")
  end

  def completed?
    !completed_at.blank?
  end

  def past_due?
    if Date.today >= deadline_date && completed_at == nil
      return true   # highlight task if past_due/true
    end
  end

end
