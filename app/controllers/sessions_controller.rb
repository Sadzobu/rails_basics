class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:return_to] || root_path
    else
      flash.now[:alert] = 'Wrong email or password. Try again.'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
  
end
