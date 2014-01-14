class UsersController < ApplicationController
  before_action :require_login, :set_active
  before_action :find_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Creado"
      redirect_to action: :index
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Actualizado"
      redirect_to action: :index
    else
      flash.now[:notice] = "No actualizado"
      render :edit
    end
  end

  private

  def set_active
    @navbar_active = "users"  
  end
  def find_user
    @user = User.cached_find params[:id]
  end
  def user_params
    params.require(:user).permit :username, :password, :email
  end
  
end
