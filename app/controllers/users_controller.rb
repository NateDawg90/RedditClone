class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(username: user_params[:username],
                     password: user_params[:password])
    if @user.save
      flash.now[:notice] = "Sign up successful!"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end