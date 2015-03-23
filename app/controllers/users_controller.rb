class UsersController < ApplicationController
  def contributionship
    @user = User.find(params[:user_id])
  end
end
