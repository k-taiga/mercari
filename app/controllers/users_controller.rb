class UsersController < ApplicationController
before_action :set_user,only:[:show,:signout,:listing,:edit]
  def show
    @user = User.find(params[:id])
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

  private

  def set_user
    @user = current_user
  end

end
