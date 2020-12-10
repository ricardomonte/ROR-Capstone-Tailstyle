class Article < ApplicationRecord

  include ImageUploader::Attachment(:image)
  
  belongs_to :user, foreign_key: :author_id, class_name: 'User'

  has_and_belongs_to_many :categories

  scope :order_by_creat, -> { order(created_at: :desc) }

  scope :first_article, -> { order(created_at: :desc).first }
end
