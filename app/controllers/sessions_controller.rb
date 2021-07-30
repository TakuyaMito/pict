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

  def destroy
    logout
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
