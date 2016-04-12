class SessionController < ApplicationController

  def create
    @user = User.find_by(username: session_params[:username])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to books_url
    else
      flash[:notice] = "something wasn't right"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to session_new_url
  end

  private

    def session_params
      params.require(:session).permit(:username, :password)
    end
end