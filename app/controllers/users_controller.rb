class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password)
  end
end
