# frozen_string_literal: true

class PurchaseOrdersController < ApplicationController
  before_action
  before_action :set_purchase_order, only: %i[show edit update destroy]

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

  def show; end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:id, :name, :grant_id, :planned_order_date)
  end



end
