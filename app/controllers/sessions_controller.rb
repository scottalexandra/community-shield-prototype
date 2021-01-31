class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: 'email@example.com')
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.name}"
      redirect_to '/dashboard'
    else
      flash[:error] = "Email or password incorrect"
    end
  end
end
