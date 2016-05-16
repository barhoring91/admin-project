class AdminUsersController < ApplicationController
  def index
    @all_users = AdminUser.all
  end
  def create
    new_user = AdminUser.new(name: params[:name], password: params[:password])
    if new_user.save
      render json: {status: {code: 200, message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end
  def show
    @user = AdminUser.find(params[:id])
  end
  def destroy
    user = AdminUser.find(params[:id])
    if user.destroy
      render json: {status: {code: 200, message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end
  def update
    user = AdminUser.find(params[:id])
    if user.update(name: params[:name], password: params[:password])
      render json: {status: {code: 200, message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end
end
