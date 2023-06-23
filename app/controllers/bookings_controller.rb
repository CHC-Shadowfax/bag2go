class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_bag, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bag = @bag
    @booking.user = current_user
    @booking_days = (@booking.end_date - @booking.start_date).to_i
    @booking.book_total_price = @booking_days * @bag.price_day
    @booking.status = "reserved"
    if @booking.save
      redirect_to bag_booking_path(@bag, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking)
          .permit(:start_date, :end_date, :booking_desc)
  end

  def set_bag
    @bag = Bag.find(params[:bag_id])
  end

end
