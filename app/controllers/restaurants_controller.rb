class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
 #  before_filter :authenticate!, :except => [:show, :index]
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end


  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
 

  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if  @restaurant.user or @restaurant.owner = current_user or current_owner
      if @restaurant.save
        flash[:notice] = "Restaurant created successfully."
        redirect_to(action: 'index')
      else
        redirect_to restaurants_path, notice: 'That post is not yours! You cannot delete it.'
        flash[:error] = @restaurant.errors.full_messages[0]
        render('new')
      end
    else
      flash[:error] = "Please login to create a new entry."
      render('new')
    end
  end


  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
 

    def update
     if @restaurant.user != current_user or current_owner
 
      if @restaurant.update(restaurant_params)
        redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
      else
        render 'edit'
      end
  end
end 


  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    if @restaurant.user != current_user or current_owner
      redirect_to restaurants_path, notice: 'That post is not yours! You cannot delete it.'
    else 
      @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :description, :phone, :image, :menu, :user, :user_id)
    end
end
