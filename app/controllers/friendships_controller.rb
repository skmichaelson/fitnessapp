class FriendshipsController < ApplicationController
  
  def create
    current_user.friendships.create(friend_id: params[:friend])
    
    new_friend = User.find(params[:friend])
    new_friend.friendships.create(friend_id: current_user.id)
    
    flash[:notices] = ["#{new_friend.username} added as a friend!"]
    redirect_to friends_user_url(current_user)
  end
  
  def destroy
    friendship = Friendship.find(params[:id])
    former_friend = User.find(params[:friend])
    friendship2 = former_friend.friendships.where("friend_id = ?", current_user.id).first
    friendship.destroy
    friendship2.destroy
    
    flash[:notices] = ["#{former_friend.username} removed from friend list"]
    redirect_to friends_user_url(current_user)
  end
end
