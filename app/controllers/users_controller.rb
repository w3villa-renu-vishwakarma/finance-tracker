class UsersController < ApplicationController
  def my_portfolio
     @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
 end


 def search
  if params[:friend].present?
    @friends = User.search(params[:friend])
    @friends = current_user.except_current_user(@friends)
    if @friends
      respond_to do |format|
        format.js
      end
    else
      flash.now[:alert] = "No user found with the given name or symbol"
    end
  else
    flash.now[:alert] = "Please enter a valid name or email to search"
  end
  respond_to do |format|
    format.js
  end
end
end
