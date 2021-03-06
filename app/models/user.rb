class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  has_many :articles, foreign_key: :author_id, class_name: 'Article', dependent: :destroy

  has_many :votes
  has_many :voted_articles, through: :votes, foreign_key: 'article_id', source: :article
end
