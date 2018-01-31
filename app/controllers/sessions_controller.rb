class SessionsController < ApplicationController

  before_action :current_user

  def new
  end

  def create
    @current_user = User.find_by(email: params[:email])
    if @current_user && @current_user.authenticate(params[:password])
    session[:user_id] = @current_user.id
    redirect_to stories_path
    else
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
  end

  protected

  def current_user
    return unless session[:user_id]
    @current_user = User.where(id: session[:user_id]).first
  end
end
