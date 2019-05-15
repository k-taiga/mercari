class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :set_item,only:[:show, :buy, :pay, :purchase]

  require 'payjp'

  def index
    @items = Item.includes(:item_images).limit(4).order("created_at DESC")
    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
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
    @buyer = current_user
    @seller = @item.user_id

    card = Credit.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "credits", action: "new"
    else
      Payjp.api_key = 'sk_test_62a0e6d04e58fcfc575e196c'
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def purchase
  end

  def show
    @category1 = Category.find(1)
    @user_items = Item.where(user_id: @item.user_id).sample(6)
  end

  def pay
    card = Credit.where(user_id: current_user.id).first
    Payjp.api_key = 'sk_test_62a0e6d04e58fcfc575e196c'
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )

  redirect_to purchase_item_path
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
