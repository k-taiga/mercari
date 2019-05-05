class ItemsController < ApplicationController


  def index
    @item = Item.find(4)
    @category = Category.find(1)
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  # 親要素itemの子要素であるitem_imageのパラメータをattributesで取得(1対多の関係)
  def item_params
    params.require(:item).permit(:name,:info,:category_id,:brand_id,:size,:status,:delivery_cost,:prefecture,:delivery_day,:price,item_images_attributes: [:image]).merge(user_id: current_user.id )
  end

end
