class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  scope :order_by_priority, -> { order(priority: :desc) }
  
  scope :order_by_creat, -> { order(created_at: :asc) }

end
