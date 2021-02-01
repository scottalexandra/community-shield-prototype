class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.name}"
      redirect_to '/dashboard'
    else
      flash.now[:error] = "Email or password incorrect"
      render :new
    end
  end
end
