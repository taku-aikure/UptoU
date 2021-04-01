class Clothe < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :category_id, numericality: { other_than: 0 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
