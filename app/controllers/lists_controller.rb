class ListsController < ApplicationController

  def index
    render json: List.all, status: :ok
  end

  def show
    @list = List.find(params[:id])
    render json: @list, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: :empty, status: :not_found
  end
end
