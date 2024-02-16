class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new, :edit, :update, :destroy]


  def create
    @user = current_user
    @gossip = Gossip.new(title: params[:title], author: @user.first_name, content: params[:content], user_id: @user.id)
    if @gossip.save
      redirect_to home_path
    else
      render :new
    end
  end

  def new
    @gossip = Gossip.new
  end

  def index
    @all_gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def edit
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update
    @gossip = Gossip.find_by(id: params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path(@gossip)
  end

  def destroy
    @gossip = Gossip.find_by(id: params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
