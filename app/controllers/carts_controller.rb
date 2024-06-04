# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item, only: %i[create destroy]

  def index
    @cart_items = current_cart.contents_of_cart
    @promotion_code = params[:promotion_code] ? PromotionCode.find_by(code: params[:promotion_code]) : return
    if @promotion_code
      flash.now[:success] = 'プロモーションコードを適用しました。'
    else
      flash.now[:warning] = '存在しないプロモーションコードです。'
    end
  end

  def create
    @cart_item = current_cart.cart_items.build(item_id: params[:item_id]) if @cart_item.blank?

    @cart_item.quantity += params[:quantity].to_i
    if CartItem.adequately_stocked?(@cart_item.item_id, @cart_item.quantity) && @cart_item.save
      flash[:success] = 'カートに追加しました。'
    else
      flash[:warning] = 'カートへの追加に失敗しました。'
    end

    redirect_to request.referer
  end

  def destroy
    @cart_item.destroy
    item = Item.find_by(id: @cart_item.item_id)
    flash[:success] = "カートから#{item.name}を削除しました。"
    redirect_to carts_path, status: :see_other
  end

  private

  def set_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
