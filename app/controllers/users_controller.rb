class UsersController < ApplicationController

  def show
  end

  def signout
  end

  def listing
    @items = Item.where(user_id: current_user.id)
  end

end
