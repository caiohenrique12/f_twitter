class Relationship < ActiveRecord::Base
  belongs_to :user

  scope :how_many_followers, -> (id) { where("follower_id = ?", "#{id}").count(:followed_id) }
  scope :how_many_users_follow, -> (id) { where("followed_id = ?", "#{id}").count(:follower_id) }
  scope :notify_user_followed, -> (followed_id) { select('users.email, relationships.created_at').joins('INNER JOIN users ON relationships.follower_id = users.id').where("relationships.followed_id = ?", "#{followed_id}").order(created_at: :desc) }
  scope :count_notify, -> (followed_id) { select('users.email, relationships.created_at').joins('INNER JOIN users ON relationships.follower_id = users.id').where("relationships.followed_id = ?", "#{followed_id}").order(created_at: :desc).count(:id) }

  def follow_user(follower_id, followed_id)
    @relationship = Relationship.new
    @relationship.follower_id = follower_id
    @relationship.followed_id = followed_id
    @relationship.save!
  end

  def check_user_followed(current_user, search_user)
    @relationship = Relationship.where("follower_id = #{current_user}")
    @relationship.each do |r|
      if r.followed_id == search_user
        return true
      end
    end
  end
end
