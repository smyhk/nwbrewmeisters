class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Account activated. Welcome to NW Brewmeisters!"
      redirect_to user # this will change to root after blog is implemented
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
