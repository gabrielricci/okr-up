class Objective < ApplicationRecord
  belongs_to :organization, optional: false
  belongs_to :objective, optional: true
  validates :description, :year, :quarter, presence: true

  def to_s
    "#{description}"
  end
end
