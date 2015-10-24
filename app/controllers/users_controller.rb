class UsersController < ApplicationController

  def show
    @user = User.find_by_uid(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @user }
    end
  end
end
