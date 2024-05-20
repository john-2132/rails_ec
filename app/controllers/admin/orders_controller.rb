# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    before_action :basic_auth, only: %i[index show]

    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
      @order_items = @order.order_items_detail
    end

    def create
      @order = Order.create(order_params)
      cart_items = current_cart.contents_of_cart

      if @cart.cart_item_quantity <= 0
        flash[:warning] = 'カートが空のため購入操作に失敗しました。'
        return redirect_to carts_path
      end

      @order_items = @order.create_order_items(cart_items)

      if @order_items.each(&:save) && @order.save
        flash[:success] = 'ご購入ありがとうございます！！'
        OrderDetailMailer.with(order: @order, order_items: @order_items).order_detail_email.deliver_now
        session.delete(:cart_id)
        redirect_to items_path
      else
        flash[:warning] = '購入に失敗しました。'
        redirect_to carts_path
      end
    end

    private

    def order_params
      params.require(:order).permit(:first_name, :last_name, :username, :email,
                                    :address, :address2, :country, :state,
                                    :zip, :same_address, :save_info, :payment_method, :cc_name,
                                    :cc_number, :cc_expiration, :cc_cvv)
    end
  end
end
