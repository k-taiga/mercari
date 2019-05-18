class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user = current_user
  end

  def edit
  end

  def update
  end

  def signout
  end

  def listing
    @items = Item.where(user_id: current_user.id)
  end

end
