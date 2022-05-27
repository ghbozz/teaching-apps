class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :games, dependent: :destroy
  has_many :user_games, dependent: :destroy
  has_many :participations, through: :user_games, source: :game

  def name
    username
  end
end
