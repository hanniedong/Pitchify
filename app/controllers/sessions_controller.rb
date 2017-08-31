class SessionsController < ApplicationController
  include SessionsHelper

  def login
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to pitches_path
    else
      @errors = ['email or password is incorrect']
      render 'login'
    end
  end

  def logout
    session[:id] = nil
    redirect_to '/'
  end
  
end
