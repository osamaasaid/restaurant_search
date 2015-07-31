class FavoritesController < ApplicationController


  def index
    @fav_rest = Favorite.all
  end

  def new
    @fav_rest = Favorite.new
  end

  def show

  end

  def create
    @user = User.find_by(id: session[:user_id])
    # @fav_rest = Favorite.create(params['yelp_id'])
    @fav_rest = @user.favorites.create(yelp_id:params[:yelp_id])
    redirect_to favorites_path
    # render json: params
  end

  private



end
