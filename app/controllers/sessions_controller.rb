class SessionsController < ApplicationController

  #login form
  def new
    # render plain: "new session"
  end

  #login action (create a session)
  def create
    # render plain: "create session"
    # render json: params
    @user = User.authenticate(params[:session][:email],params[:session][:password])

    if @user
      #correct email / password
      session[:user_id] = @user.id
      flash[:success] = 'You are now logged in.'
      redirect_to root_path
    else
      #wrong email or password
      flash[:danger] = 'Invalid email or password.'
      # render :new
      redirect_to login_path
    end

  end

  #logout action (invalidates the session)
  def destroy
    # render plain: "destroy session"
    session[:user_id] = nil
    flash[:info] = "You are logged out."
    redirect_to login_path
  end

end














# class SessionsController < ApplicationController
#   def new
#   end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user && user.authenticate(params[:session][:password])
#       log_in user
#       redirect_to user
#     else
#      flash.now[:danger] = 'Invalid email/password combination'
#       render 'new'
#   end

#   def destroy
#     log_out
#     redirect_to root_url
#   end



# end
# end
