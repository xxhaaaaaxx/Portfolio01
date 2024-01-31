class UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create]
  # ログイン画面で新規登録するための処理
  # 新規登録に関わるアクション(new, create)をリダイレクトから除外

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    user.save!
    redirect_to users_url, notice: "「#{user.name}」を登録しました。"
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to users_url
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end


  private
    def user_params
      # ストロングパラメータ：意図しない（安全では無い）データの登録・更新を防ぐ
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  end
