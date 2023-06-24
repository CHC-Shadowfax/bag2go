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
      # redirect_to booking_path(@booking)
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_prbookings
    @bookings = Booking.where(status: "reserved")
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def update_status
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: params[:update_status])
    flash[:notice] = "Booking status updated!"
    redirect_to bags_path
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

  def status_params
    params.require(:booking).permit(:status)
  end

end
