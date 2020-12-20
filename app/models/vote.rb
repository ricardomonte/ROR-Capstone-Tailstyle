class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  scope :favorite, -> { group(:article_id).order('count_id DESC').count('id') }
end
