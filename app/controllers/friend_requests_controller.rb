class FriendRequestsController < ApplicationController
  
  def create
    new_friend = User.find(params[:friend_id])
    friend_request = new_friend.friend_requests.new(friend_id: current_user.id)
    
    if friend_request.save
      flash[:notices] = ["Request sent!"]
      redirect_to users_url
    else
      flash.now[:errors] = friend_request.errors.full_messages
      render 'users/index'
    end
    
  end
  
  def destroy
    request = FriendRequest.find(params[:id])
    request.destroy
    flash[:notices] = ["Request denied"]
    redirect_to friends_user_url(current_user)
  end
end
