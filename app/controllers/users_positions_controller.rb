class UsersPositionsController < ApplicationController
  def update
    params[:users].each do |user_to_update|
      user = User.find(user_to_update['id'])
      user.update(position: user_to_update['position'])
    end
    render json: User.all.order(:position), status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:position)
  end
end
