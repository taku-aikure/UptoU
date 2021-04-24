class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :encrypted_password
    validates :password,
      format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end

  with_options numericality: { other_than: 1 } do
    validates :gender_id
    validates :prefecture_id
  end

  has_many :clothes
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

end
