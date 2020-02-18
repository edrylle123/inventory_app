class WarehousesController < ApplicationController
  before_action :assign_warehouse, only: %i[show edit update destroy]

  def index
    @warehouses = Warehouse.all
  end

  def show; end
#
#   def edit; end
#
#   def new
#     @product = Product.new
#   end
#
#   def create
#     @product = Product.new(product_params)
#
#     if @product.save
#       flash.notice = 'Successfully created a product.'
#
#       redirect_to product_path(@product)
#     else
#       render :new
#     end
#   end
#
#   def update
#     if @product.update(product_params)
#       flash.notice = 'Successfully updated product.'
#
#       redirect_to product_path(@product)
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     @product.destroy!
#
#     flash.notice = "Successfully deleted product #{@product.id}."
#     redirect_to products_path
#   end
#
#
private

  def assign_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:street, :city, :province)
  end
end
