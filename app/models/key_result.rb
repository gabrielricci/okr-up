class KeyResult < ApplicationRecord
  belongs_to :objective

  def to_s
    "#{description}"
  end
end
