class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = @current_user.id
    if session[:return_to]
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      redirect_to stories_path
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
  end
end
