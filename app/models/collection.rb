class Collection < ActiveRecord::Base
  attr_accessible :description, :name, :number, :parent_id

  validates :name, presence: true

  has_ancestry
  has_many :entries, dependent: :destroy

  def update_number!
    change = 0;
    if entries.count == 1
      change = entries.last.total
    else
      # calculate the difference needed to update ancestors.
      change = entries[-1].total - entries[-2].total
    end
    self.number = entries.last.total
    self.save

    self.ancestors.each do |collection|
      collection.number = collection.number + change
      collection.save
    end
  end
end
