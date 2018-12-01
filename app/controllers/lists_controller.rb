class ListsController < ApplicationController
  def index
    render json: List.all, status: :ok
  end
end
