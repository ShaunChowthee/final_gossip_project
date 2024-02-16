class HomeController < ApplicationController
  def index
    @name = params[:name]
  end

  def team
    render :team
  end

  def contact
    render :contact
  end
end
