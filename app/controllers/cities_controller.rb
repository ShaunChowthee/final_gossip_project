class CitiesController < ApplicationController
  def create
  end

  def new
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find_by(id: params[:id])
    @gossip = Gossip.find_by(id: params[:id])
    @gossip_list = []

    if @city
      users_from_city = User.where(city: @city)
      users_from_city.each do |user|
        gossips = Gossip.where(user_id: user.id)
        @gossip_list.concat(gossips)
      end
    else
      # Handle the case when the city with the provided id is not found
      redirect_to root_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
