# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.with_attached_image
  end

  def show
    @item = Item.find(params[:id])
    @related_products = @item.related_products
  end
end
