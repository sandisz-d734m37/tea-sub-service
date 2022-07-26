class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :shipping_address)
  end
end
