class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  with_options presence: true do
    validates :image
    validates :detail
  end

  with_options numericality: { other_than: 1 } do
    validates :season_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :season

end
