class FriendController < ApplicationController

  def index
    @firends = current_user.friends
  end

  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Following user"
    else
      flash[:alert] = "There was something wrong with the tracking request."
    end
    redirect_to friends_path
  end

  def search_friend
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'friend/friend_result'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid name to search"
          format.js { render partial: 'friend/friend_result'}
        end 
      end
    else 
      respond_to do |format|
        flash.now[:alert] = "Please enter a name to search"
        format.js { render partial: 'friend/friend_result'}
      end 
    end
    #render json: params#params[:friend]
  end

  def destroy
    friendships = current_user.friendships.where(friend_id: params[:id]).first
    friendships.destroy
    flash[:notice] = "Stop following."
    redirect_to friends_path
  end

end
