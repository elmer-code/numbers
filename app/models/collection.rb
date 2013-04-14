class Collection < ActiveRecord::Base
  attr_accessible :description, :name, :number, :parent_id

  validates :name, presence: true

  has_ancestry
  has_many :entries, dependent: :destroy

  def update_number!
    if entries.count == 1
      self.number = entries.last.total
      self.save
    end
  end
end
