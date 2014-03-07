class FriendRequestsController < ApplicationController

  def create
    new_friend = User.find(params[:friend_id])
    friend_request = new_friend.friend_requests.new(friend_id: current_user.id)

    if friend_request.save
      if current_user.is_demo
        flash[:demo] = ["Request sent. Let's wait for their reply!"]
        flash[:demo] << "In the meantime, make another friend request or <a href='#{diary_user_url(current_user)}'>check out your food diary</a>".html_safe
      else
        flash[:notices] = ["Request sent!"]
      end
      redirect_to users_url
    else
      flash.now[:errors] = friend_request.errors.full_messages
      render 'users/index'
    end

  end

  def destroy
    request = FriendRequest.find(params[:id])
    request.destroy
    flash[:notices] = ["Friend request cancelled"]
    redirect_to users_url
  end
end
