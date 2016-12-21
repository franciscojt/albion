class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "User has been succesfully logged in"
      redirect_to new_session_path
    else
      flash[:errors] = ["Email and/or password do not match"]
    end
  end

  def destroy
  end
  private
    def sessions_params
      params.require(:user).permit(:email, :password)
    end
end
