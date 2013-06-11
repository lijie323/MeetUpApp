class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:name])
    if @user.present? && @user.authenticate(params[:password])
      if @user.name == "Admin"
        session[:user_id] = @user.id
        redirect_to users_url
      else
        session[:user_id] = @user.id
        redirect_to root_url
      end
    else
      flash[:notice] = "Wrong username or password"
      redirect_to sign_in_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "See ya!"
  end
end


