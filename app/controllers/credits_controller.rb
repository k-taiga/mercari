class CreditsController < ApplicationController
  require "payjp"
  before_action :set_credit

  def index
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    credit = Credit.where(user_id: current_user.id).first
    redirect_to action: "index" if credit.present?
  end

 # indexアクションはここでは省略

  def create #PayjpとCreditのデータベースを作成
    Payjp.api_key = 'sk_test_62a0e6d04e58fcfc575e196c'

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        credit: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, credit_id: customer.default_card)
      if @credit.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_credit
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end
end
