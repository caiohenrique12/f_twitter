class Post < ActiveRecord::Base

  validates_presence_of :title, :text, :user_id
  validates_length_of :text, maximum: 127
  validates_length_of :title, maximum: 30


  scope :find_by_post, -> (user_id) { where('user_id = ?', "#{user_id}")}

end
