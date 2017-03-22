class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies[:user_id] = user.id
    #flash[:success] = "Welcome, #{user.name}!"
    #redirect_to root_url
    respond_to do |format|
        format.html { redirect_to root_path, notice: "Welcome, #{user.name}!" }
        format.json { head :no_content }
    end
  end

  def destroy
    cookies.delete(:user_id)
    #flash[:success] = "Goodbye!"
    #redirect_to root_url
    respond_to do |format|
        format.html { redirect_to root_path, notice: 'Goodbye!' }
        format.json { head :no_content }
    end
  end

  def auth_fail
    render text: "You've tried to authenticate via #{params[:strategy]}, but the following error
occurred: #{params[:message]}", status: 500
  end
end