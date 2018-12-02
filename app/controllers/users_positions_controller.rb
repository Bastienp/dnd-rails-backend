class UsersPositionsController < ApplicationController
  def update
    User.change_users_order(params[:users])
    ordered_users = User.ordered_by_position
    ActionCable.server.broadcast('boards_channel', users: ordered_users)
    render json: ordered_users, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:position)
  end
end
