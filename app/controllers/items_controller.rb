# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_purchase_order, only: %i[create edit new update destroy]
  before_action :set_item, only: %i[show edit update destroy]

  def new
    @item = current_user.send(set_type.pluralize).new
    @item_category = ItemCategory.new
  end

  def edit; end

  def show
    # @items = @purchase_order.items
  end

  def create
    @item_category = ItemCategory.new(purchase_order_id: @purchase_order.id)
    @item = current_user.send(set_type.pluralize).new(item_params)
    @item.item_category = @item_category
    if @item.save
      redirect_to purchase_order_path(@purchase_order.id)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def update
    if @item.update(item_params)
      redirect_to purchase_order_path(@purchase_order.id)
    end
  end

  def destroy
    @item.destroy
    redirect_to purchase_order_path(@purchase_order.id)
  end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:purchase_order_id])
  end

  def set_item
    @item = current_user.send(set_type.pluralize).find(params[:id])
  end

  def set_type
    case params[:type]
    when 'Chemical'
      'chemical'
    when 'Expendable'
      'expendable'
    end
  end

  def item_params
    params.require(set_type.to_sym).permit(:type, :item_name, :link, :item_price, :catalogue_number, :provider_name, :currency_name,
                                           :number_of_items, :packaging, :remarks, :cid, :formula_url, :cas_number, :purity)
  end
end
