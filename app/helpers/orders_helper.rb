# frozen_string_literal: true

module OrdersHelper
  def order_form_url(promotion_code)
    if promotion_code
      admin_orders_path(code: promotion_code.code, discount_price: promotion_code.discount_price)
    else
      admin_orders_path
    end
  end
end
