class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 'user', admin: 'admin' }

  has_many :favorites
  has_many :restaurants, through: :favorites

  has_many :reviews, dependent: :destroy

  validates :nickname, presence: true
end
