class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @thoughts=@user.thoughts
  end

end
