class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to root_url, notice: "Added friend."
    else
      redirect_to root_url, notice: "Unable to add friend."
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    
    redirect_to current_user, notice: 'Removed friend'
  end
end
