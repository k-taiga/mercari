class ItemsController < ApplicationController


  def index

  end

  def new
    @item = Item.new
    # @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  # 後にbrandとsizeのカラムを追加
  def item_params
    params.require(:item).permit(:name,:info,:category,:sell_status,:deilvery_way,:prefecture,:delivery_date,:price,images_attributes: [:image])
  end

end
