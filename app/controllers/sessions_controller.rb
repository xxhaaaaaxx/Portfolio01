class SessionsController < ApplicationController

  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      # ぼっち演算子「&」オブジェクトの中身がnullのときfalseを返す
      # authenticateメソッド
      session[:user_id] = user.id
      redirect_to books_path
      # このコードにより
      # 誰もログインしていない状態 => session[:user_id]はnull
      # ログインされている状態 => session[:user_id]にログイン中のユーザーIDが入る

    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
    
  end
