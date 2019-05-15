# frozen_string_literal: true

class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: %i[show edit update destroy]
  before_action :requires_same_user, only: %i[update destroy]

  def index
    @purchase_orders = PurchaseOrder.where('planned_order_date >= ?', Date.today).page(params[:page]).per(30)
  end

  def new
    @purchase_order = PurchaseOrder.new
    @user_order = current_user.user_orders.new
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      @user_order = current_user.user_orders.new(purchase_order_id: @purchase_order.id)
      @user_order.save
      redirect_to user_orders_path, notice: I18n.t('shared.created', resource: 'Purchase Order')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def show
    @purchase_order.items
    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='items.xlsx'"
      }
      format.html {render :show}
    end

    #excell_service = ExcellService.new(@purchase_order.items)
    #excell_service.generate_file

  end

  def edit;
  end

  def update
    if @purchase_order.update(purchase_order_params)
      redirect_to user_orders_path, notice: I18n.t('shared.updated', resource: 'Purchase Order')
    else
      render :edit
    end
  end

  def destroy
    @purchase_order.destroy
    redirect_to user_orders_path, notice: I18n.t('shared.deleted', resource: 'Purchase Order')
  end

  private

  def set_purchase_order
    @purchase_order ||= PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:id, :name, :grant_id, :planned_order_date)
  end
end

def requires_same_user
  if @purchase_order.user_orders.where(user_id: current_user.id) == current_user.id
    flash[:danger] = 'Access denied'
    redirect_to purchase_order_path
  end
end
