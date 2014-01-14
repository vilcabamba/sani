# encoding: utf-8
class SessionsController < ApplicationController

  def index
  end
  def create
    if user = login(params[:username], params[:password])
      redirect_back_or_to root_path, notice: "Bienvenido, #{user.username}"
    else
      render :index, notice: "Nombre de usuario o contraseña incorrectos"
    end
  end
  def destroy
    logout
    redirect_to login_path
  end
end
