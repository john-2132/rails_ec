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
      cart_items = current_cart.contents_of_cart

      if @cart.cart_item_quantity <= 0
        flash[:warning] = 'カートが空のため購入操作に失敗しました。'
        return redirect_to carts_path
      end

      begin
        Order.transaction do
          @order = Order.new(order_params)
          @order_items = @order.checkout_order(cart_items)
          flash[:success] = 'ご購入ありがとうございます！！'
          OrderDetailMailer.with(order: @order, order_items: @order_items).order_detail_email.deliver_now
          session.delete(:cart_id)
          redirect_to items_path
        end
      rescue ActiveRecord::RecordInvalid
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
