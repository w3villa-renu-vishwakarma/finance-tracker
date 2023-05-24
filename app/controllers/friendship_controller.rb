class FriendshipController < ApplicationController
  def create
    friend = User.find(params[:friend_id])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "You are following user"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to my_friends_path
  end

  def destroy
      friendship = current_user.friendships.where(friend_id: params[:id]).first
      friendship.destroy

      flash[:notice] = " removed from your following list"
      redirect_to my_friends_path
  end
end
