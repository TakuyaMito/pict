class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました。'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
