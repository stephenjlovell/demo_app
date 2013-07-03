class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  default_scope order: 'microposts.created_at DESC'

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def self.from_users_followed_by(user)
    # SELECT * FROM MICROPOSTS 
    # WHERE user.id IN ( SELECT followed_id FROM relationships WHERE follower_id = current_user ) 
    #               OR user.id = current_user

    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where( "user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id )
  end
end
