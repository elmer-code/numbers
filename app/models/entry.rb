class Entry < ActiveRecord::Base
  belongs_to :collection
  attr_accessible :total

  validates :total, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
end
