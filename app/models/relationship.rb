class Relationship < ActiveRecord::Base

  def self.follow_user(follower_id, followed_id)
    @relationship = Relationship.new
    @relationship.follower_id = follower_id
    @relationship.followed_id = followed_id
    @relationship.save!
  end

  scope :how_many_followers, -> (id) { where("follower_id = ?", "#{id}").count(:followed_id) }
  scope :how_many_users_follow, -> (id) { where("followed_id = ?", "#{id}").count(:follower_id) }

  def check_user_followed(current_user, search_user)
    @relationship = Relationship.where("follower_id = #{current_user}")
    @relationship.each do |r|
      if r.followed_id == search_user
        return true
      end
    end
  end

end
