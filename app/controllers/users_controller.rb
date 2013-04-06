class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
    if !@user.admin
      @project = Project.find_by_id(AssignedProject.find_by_user_id(@user.id).project_id)
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
end
