class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録完了しました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
