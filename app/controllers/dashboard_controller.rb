class DashboardController < ApplicationController
  # Asegurar que ya este loggeado el usuario
  helper_method :bags, :bookings_as_owner, :bags_as_customer, :bookings
  before_action :authenticate_user!

  def index
  end

  private

  def bookings
    @bookings = current_user.bookings
  end

  def bags
    @bags = current_user.bags
  end

  def bags_as_customer
    @bags_as_customer = current_user.bags_as_customer.distinct
  end

  def bookings_as_owner
    @bookings = current_user.bookings_as_owner
  end
end
