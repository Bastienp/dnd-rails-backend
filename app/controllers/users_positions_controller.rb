class UsersPositionsController < ApplicationController
  def update
    params[:users].each_with_index do |user_to_update, index|
      user = User.find(user_to_update['id'])
      user.update(position: index)
    end
    ordered_users = User.ordered_by_position
    ActionCable.server.broadcast('boards_channel', users: ordered_users)
    render json: ordered_users, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:position)
  end
end
