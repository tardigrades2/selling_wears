class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :update, :destroy]
  before_action :set_cart_item, only: [:update, :destroy]
  before_action :logged_in_user

  def create
    @cart.add_product params[:product]
    if @cart.save
      redirect_to carts_path
    else
      redirect_to @product
    end
  end

  def update
    if @cart_item.update cart_item_params
      flash[:success] = 'Updated cart successfully'
    else
      flash[:danger] = 'Something wrong, try again!'
    end
    redirect_to carts_path
  end

  def destroy
    @cart_item.destroy
    redirect_to carts_path
  end

  private

  def set_cart_item
    @cart_item = current_cart.cart_items.find_by id: params[:id]
  end

  def cart_item_params
    params.require(:cart_item).permit :product_id, :cart_id, :quantity
  end
end
