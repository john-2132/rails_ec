# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :require_admin

    def index
      @items = Item.with_attached_image
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)

      if @item.save
        redirect_to admin_products_path, notice: "商品名「#{@item.name}」を登録しました。"
      else
        flash.now[:alert] = "登録コード「#{@item.code}」は既に存在します。"
        render :new
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])

      if @item.update(item_params)
        redirect_to admin_products_path, notice: "商品名「#{@item.name}」を更新しました。"
      else
        render :edit
      end
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to admin_products_url, notice: "商品名「#{@item.name}」を削除しました。"
    end

    private

    def item_params
      params.require(:item).permit(:name, :catalog_price, :sale_price, :code, :description, :stock, :image)
    end

    def require_admin
      redirect_to root_url unless current_user.admin?
    end
  end
end
