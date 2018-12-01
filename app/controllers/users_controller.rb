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
end
