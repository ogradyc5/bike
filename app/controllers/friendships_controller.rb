class FriendshipsController < ApplicationController
    def destroy
        
        @friendship = current_user.friendships.where(friend_id: params[:id]).first
        @friendship.save
        @friendship.create_activity :destroy, owner: current_user
        @friendship.destroy
        
        flash[:notice] = "Friend was successfully removed"
        redirect_to my_profile_path
    end
    
   
end
