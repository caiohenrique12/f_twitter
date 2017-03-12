class Relationship < ActiveRecord::Base

  def self.follow_user(follower_id, followed_id)
    @relationship = Relationship.new
    @relationship.follower_id = follower_id
    @relationship.followed_id = followed_id
    @relationship.save!
  end
end
