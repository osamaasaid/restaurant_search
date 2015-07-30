class MainController < ApplicationController

  # before_action :is_authenticated?, only: [:secret]
  # before_action :is_authenticated?, except: [:index]

  def index

  end

def show
    @query = params[:id]
    # if @query
    #   response = client.search('Seattle')
    #   @place = JSON.parse(response)
    # else
    #   @place = ['']
    # end
    if @query
      response = Yelp.client.search('united states',{term: @query})
      @result = response.businesses[0...20]
      # render json: @result
    else
      @result = ['']
    end
  end
  # def about
  # end

  # def secret
  # end


end