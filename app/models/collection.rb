class Collection < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, presence: true

  has_ancestry
  has_many :entries, dependent: :destroy
end
