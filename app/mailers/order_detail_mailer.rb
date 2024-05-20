# frozen_string_literal: true

class OrderDetailMailer < ApplicationMailer
  default from: 'order_detail@example.com'
  def order_detail_email
    @order = params[:order]
    @order_items = params[:order_items]

    mail(to: @order.email, subject: '商品購入詳細')
  end
end
