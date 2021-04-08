class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image

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
