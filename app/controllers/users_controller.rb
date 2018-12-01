class UsersController < ApplicationController
  def index
    render json: User.all, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: :empty, status: :not_found
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :list_id)
  end
end
