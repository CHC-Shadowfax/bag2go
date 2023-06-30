class PagesController < ApplicationController
  before_action :authenticate_user!, only: :home

  # Esto expone el metodo bags dentro de la vista de home.html.erb
  helper_method :bags, :bookings_as_owner, :bags_as_customer, :bookings

  def home
    @bags = Bag.all.sample(9)
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
