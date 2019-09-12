class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # success
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      
      # 次の行をログイン後に遷移するページに置き換える
      redirect_back_or user
    else
      # failure
      flash.now[:danger] = "Invalid email/password combination"
      redirect_to controller: 'static_pages', action: 'home'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
