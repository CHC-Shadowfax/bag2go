class BookingsController < ApplicationController
  before_action :set_bag
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  helper_method :booking

  def index
    @bookings = @bag.bookings
  end

  def new
    @booking = @bag.bookings.new
  end

  def show
    @booking = @bag.bookings.find(params[:id])
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

  def update
    if @booking.update(status: params[:update_status])
      flash[:notice] = "Booking status updated!"
    else
      flash[:alert] = "Booking status not updated!"
    end

    redirect_to bags_path
  end

  def my_br
    @bookings = Booking.where(status: "reserved", bag: current_user.bags)
  end

  private

  attr_reader :booking

  # Always scope your queries to the resource that you are nesting in.
  def set_booking
    @booking = @bag.bookings.find(params[:id])
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
