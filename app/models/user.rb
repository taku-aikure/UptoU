class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :encrypted_password,
    format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i}
  end

  with_options numericality: { other_than: 1 } do
    validates :gender_id
    validates :prefecture_id
  end

end
