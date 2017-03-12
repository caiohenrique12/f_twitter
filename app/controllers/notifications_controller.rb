class NotificationsController < ApplicationController
  def index
    @relationships = Relationship.notify_user_followed(current_user.id)
  end
end
