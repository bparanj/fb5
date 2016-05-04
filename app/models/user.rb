class User < ApplicationRecord
  has_secure_password
  
  validates :email, uniqueness: true
  # validates :password, length: { minimum: 8 }
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  def username
    email.split('@')[0]
  end
end
