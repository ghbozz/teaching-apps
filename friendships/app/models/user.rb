class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_friendships, -> { where accepted: true }, 
           foreign_key: :sender_id, class_name: 'Friendship', 
           dependent: :destroy

  has_many :active_friends, through: :active_friendships, source: :receiver, class_name: 'User'

  has_many :inverse_active_friendships, -> { where accepted: true }, 
           foreign_key: :receiver_id, class_name: 'Friendship', 
           dependent: :destroy

  has_many :inverse_active_friends, through: :inverse_active_friendships, source: :sender, class_name: 'User'

  has_many :pending_friendships, -> { where accepted: nil },
           foreign_key: :sender_id, class_name: 'Friendship', 
           dependent: :destroy

  has_many :pending_friends, through: :pending_friendships, source: :receiver

  has_many :inverse_pending_friendships, -> { where accepted: nil }, 
           foreign_key: :receiver_id, class_name: 'Friendship', 
           dependent: :destroy

  has_many :inverse_pending_friends, through: :inverse_pending_friendships, source: :sender

  def all_active_friends
    active_friends + inverse_active_friends
  end

  def all_pending_friends
    pending_friends + inverse_pending_friends
  end

  def all_demands
    pending_friendships + inverse_pending_friendships
  end

  def friend_with?(user)
    all_active_friends.include?(user)
  end
end
