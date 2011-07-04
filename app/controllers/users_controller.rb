class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.students.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      render :action=>"new"
    end
  end
  
  def index
    @student_count = User.students.count
    @students = User.students.find(:all,:order=>"created_at desc",:limit=>10)
  end
  
  def profile
    
  end
end
