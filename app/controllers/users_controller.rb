class UsersController < ApplicationController

  def show
    @user = User.find_by_uid(params[:id])
    render :json => @user
  end
end
