class StaticPagesController < ApplicationController
  def home
  	if  signed_in?
	  	@user = current_user
      @users = User.all
	  	# @projects = Project.all 
	  	@project_all = Project.all
	  	@assiged_projects = AssignedProject.where(user_id: @user.id)
	  	@projects = Project.where(id: @assiged_projects.select(:project_id))
  	end
  end

  def help
  end

end
