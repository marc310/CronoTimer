class AdminController < ApplicationController
  before_action :authorize
  before_action :authenticate_user!

  # Lista todos o usuarios
  def index
    @users = User.all
  end

  # Adiciona Role Supervisor
  def supervisor
    remove_last_role
    @user.add_role(:supervisor)
    redirect_to '/admin', notice: 'Role Supervisor was successfully updated.'
  end

  # Adiciona Role Operator
  def operator
    remove_last_role
    @user.add_role(:operator)
    redirect_to '/admin', notice: 'Role Operator was successfully updated.'
  end


  private

  # Autoriza somente acesso com role admin page /admin
  def authorize
    if !current_user.has_role? :admin
      redirect_to root_url
    end
  end

  # Remove a ultima role do usuario
  def remove_last_role
    @user = User.find(params[:id])
    @user.roles = []
  end  
end
