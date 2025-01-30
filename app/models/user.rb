class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 50 } # 名前は必須で最大50文字
  validates :introduction, length: { maximum: 300 }       # 自己紹介は任意で最大300文字
  has_many :quizzes, dependent: :destroy
  has_many :follows, foreign_key: :follower_id
  has_many :followed_users, through: :follows, source: :followed
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
