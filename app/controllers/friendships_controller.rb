class FriendshipsController < ApplicationController
  
  def create
    new_friend = User.includes(:friends).includes(:friendships).find(params[:friend_id])
    if current_user.friends.include?(new_friend)
      flash[:notices] = ["You are already friends with #{new_friend.username}!"]
    else
      new_friendship = current_user.friendships.new(friend_id: new_friend.id)
      pending_friendship = new_friend.friendships.where("friend_id = ?", current_user.id)
      
      if pending_friendship.empty?
        new_friendship.status = "PENDING"
        new_friendship.save
        flash[:notices] = ["Friendship request sent to #{new_friend.username}."]
      else
        new_friendship.status = "APPROVED"
        pending_friendship.first.update_attributes({ status: "APPROVED" })
        flash[:notices] = ["You are now friends with #{new_friend.username}!"]
      end
    end
    
    redirect_to users_url
  end
end
