class BagsController < ApplicationController
  before_action :set_bag, only: %i[show edit update destroy]

  def index
    @bags = Bag.all
    if params[:query].present?
      @bags = Bag.search_by_name_or_features(params[:query])
    else
      @bags = Bag.all
    end
  end

  def show
  end

  def my_bags
    @bags = Bag.where(user: current_user)
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if @bag.save
      redirect_to bag_path(@bag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @bag.update(bag_params)
      redirect_to bag_path(@bag), notice: "Bag was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bag.destroy
    redirect_to bags_path, notice: "Bag was successfully destroyed.", status: :see_other
  end


  private

  def set_bag
    @bag = Bag.find(params[:id])
  end

  def bag_params
    params.require(:bag).permit(:name, :description, :price_day, :sku, :photo)
  end
end
