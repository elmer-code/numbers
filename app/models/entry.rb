class Entry < ActiveRecord::Base
  belongs_to :collection
  attr_accessible :total

  validates :total, presence: true
end
