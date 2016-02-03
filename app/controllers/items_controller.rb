class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)

    if @item.save(item_params) 
      render json: { id: @item.id }
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params) 
      render json: { id: @item.id }
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      head :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.permit!
    end    
end
