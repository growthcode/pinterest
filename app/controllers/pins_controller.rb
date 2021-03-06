class PinsController < ApplicationController
  before_action :set_pin, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    set_pin_index
    respond_with(@pins)
  end

  def show
    set_pin_show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = current_user.pins.new(pin_params)
    @pin.save
    respond_with(@pin, location: :root)
  end

  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin_index
      if current_user
        @pins = current_user.pins.order(created_at: :desc)
      else
        @pins = Pin.order(created_at: :desc)
      end
    end

    def set_pin_show
      if current_user
        @pin = current_user.pins.find(params[:id])
      else
        @pin = Pin.find(params[:id])
      end
    end

    def set_pin
      @pin = current_user.pins.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :image_remote_url)
    end

end
