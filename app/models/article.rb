class Article < ApplicationRecord

  include ImageUploader::Attachment(:image)

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true

  
  belongs_to :user, foreign_key: :author_id, class_name: 'User'

  has_and_belongs_to_many :categories

  has_many :votes
  has_many :received_votes, through: :votes, foreign_key: 'user_id', source: :user

  scope :order_by_creat, -> { order(created_at: :desc) }

  scope :first_article, -> { order(created_at: :desc).first }
end
