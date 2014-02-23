class UsersController < ApplicationController
  before_action :require_login, :set_active
  before_action :require_admin, only: [:new, :create]

  expose(:users) {
    if current_user.admin?
      User.all
    else
      [current_user]
    end
  }

  expose(:user) {
    if current_user.admin?
      User.find params[:id]
    else
      current_user
    end
  }

  expose(:businesses) {
    user.businesses.includes(:user)
  }

  def index
    redirect_to action: :show, id: user.id unless current_user.admin?
  end

  def new
    self.user = User.new
  end

  def create
    self.user = User.new user_params
    if user.save
      flash[:notice] = "Creado"
      redirect_to action: :index
    else
      flash.now[:notice] = "No creado"
      render :new
    end
  end

  def update
    if user.update_attributes(user_params)
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

  def user_params
    params.require(:user).permit :username, :password, :email
  end
end
