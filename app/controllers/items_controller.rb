class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :set_item,only:[:show,:look,:edit,:update,:destroy]


  def index
    @items = Item.includes(:item_images).limit(4).order("created_at DESC")
    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
    @brand1 = Brand.find(1)
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

  def buy
    @item = Item.find(params[:id])
    @category1 = Category.find(1)
    @user_items = Item.where(user_id: @item.user_id).sample(6)
  end

  def show
    @user_items = Item.where(user_id: @item.user_id).sample(6)
  end

  def look
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to look_item_path
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to items_path
  end

  def pay
      Payjp.api_key = 'sk_test_62a0e6d04e58fcfc575e196c'
      charge = Payjp::Charge.create(
      :amount => @price,
      :card => params['payjp-token'],
      :currency => 'jpy',
  )
  end

  private

  # 親要素itemの子要素であるitem_imageのパラメータをattributesで取得(1対多の関係)
  def item_params
    params.require(:item).permit(:name,:info,:category_id,:brand_id,:size,:status,:delivery_cost,:prefecture,:delivery_day,:price,item_images_attributes: [:image]).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
