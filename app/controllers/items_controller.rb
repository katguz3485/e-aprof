class ItemsController < ApplicationController

  before_action :set_item, only: %i[show edit update destroy]


  def new
    @item = current_user.send(set_type.pluralize).new

  end

  def edit
  end

  def create
    @item = current_user.send(set_type.pluralize).new(item_params)
    if @item.save
      redirect_to @item, "#{params[:type]} Contact was successfully created."
    else
      render :new
    end
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
    redirect_to @sitem, notice: "#{params[:type]} was successfully destroyed."
  end

  private

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
    params.require(set_type.to_sym).permit(:type, :item_name, :link, :item_price, :catalogue_number, :provider_name,
                                           :number_of_items, :packaging, :remarks, :cid, :formula_url, :cas_number, :purity)
  end


end


