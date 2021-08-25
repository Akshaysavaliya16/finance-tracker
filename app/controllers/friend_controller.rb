class FriendController < ApplicationController

  def index
    @firends = current_user.friends
  end

  def destroy
    user = User.find(params[:id])
    friendships = Friendship.where(user_id: current_user.id, friend_id: user.id).first
    friendships.destroy
    flash[:notice] = "#{user.full_name} was successfully removed from your friend list."
    redirect_to friendships_path
  end

end
