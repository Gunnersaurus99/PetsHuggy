class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show,:edit,:basics,:update,:description,:address,:price,:photos,:calender,:bankaccount,:publish]

  def index
    @listings = current_user.listings
  end

  def show
    @photos = @listing.photos
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成・保存しました"
    else
      redirect_to new_listing_path, notice: "リスティングを作成・保存できませんでした"
    end
  end

  def edit
  end

  def basics
  end

  def new
    @listing = current_user.listings.build
  end

  def update
    if @listing.update(listing_params)
      redirect_to :back, notice: "更新できました"
    end
  end

  def description
  end


  def address
  end


  def price
  end


  def photos
    @photo = Photo.new
  end


  def calender
  end


  def bankaccount
  end


  def publish
  end


  private

   def listing_params
    params.require(:listing).permit(:pet_type,:home_type,:breeding_years,:pet_size,:price_per_night,:address)
  end

   def set_listing
    @listing= Listing.find(params[:id])
   end
























end
