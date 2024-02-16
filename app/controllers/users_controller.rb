class UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      city_name = params[:user].delete(:city)
      city = City.find_or_create_by(name: city_name)
      @user = User.new(user_params.merge(city_id: city.id))  
      if @user.save
        redirect_to new_session_path
      else
        puts user_params
        render :new
      end
    end
  end

  def new
    @user = User.new
  end

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city)
  end
end

