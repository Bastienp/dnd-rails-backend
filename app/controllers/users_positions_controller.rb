class UsersPositionsController < ApplicationController
  def update
    params[:users].each_with_index do |user_to_update, index|
      user = User.find(user_to_update['id'])
      user.update(position: index)
    end
    render json: User.ordered_by_position, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:position)
  end
end
