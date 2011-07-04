class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user] = @user.id
      redirect_to edit_user_path(@user)
    else
      render :action=>"new"
    end
  end
  
  def index
    @student_count = User.students.count
    @students = User.students.find(:all,:order=>"created_at desc",:limit=>10)
  end
  
  def edit
    
  end
end
