class ItemsController < ApplicationController

  before_action :set_purchase_order, only: %i[create show]
  before_action :set_item, only: %i[show edit update destroy]


  def new
    @item = current_user.send(set_type.pluralize).new
    @item_category = ItemCategory.new
  end

  def edit
  end

  def create


    @item_category = ItemCategory.new(purchase_order_id: @purchase_order.id)
    #@item_category = ItemCategory.new(purchase_order_id: 1)
    @item = current_user.send(set_type.pluralize).new(item_params)
    @item.item_category = @item_category
    @item.save
   redirect_to purchase_orders_path
    # render :new

    # @item_category = ItemCategory.new(purchase_order_id: @purchase_order.id)
    # @item_category.save

    # redirect_to @item, "#{params[:type]} was successfully created."
    #redirect_to @item, " was successfully created."

    # else
    #   flash.now.alert = I18n.t('shared.error_create')
    #   render :new
    # end
  end

  def index
    @items = Item.all

  end


  def update
    if @item.update(item_params)
      redirect_to @item, notice: I18n.t('shared.deleted', resource: "#{params[:type]}")
    end
  end

  def destroy
    @item.destroy
    redirect_to @item, notice: "#{params[:type]} was successfully destroyed."
  end

  private

  def set_purchase_order
    #purchase_order = PurchaseOrder.find(params.fetch(:po))
    @purchase_order = PurchaseOrder.find(params[:po])
    #@purchase_order = PurchaseOrder.find(24)
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


