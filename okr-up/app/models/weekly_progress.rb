class WeeklyProgress < ApplicationRecord
  belongs_to :key_result, optional: false
  validates :year, :week, :progress, presence: true
end
