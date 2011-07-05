class UsersController < ApplicationController

  def authenticate 
   if  current_user=User.authenticate(params[:user][:name],params[:user][:password])
     session[:current_user] = current_user.id 
     #render :text=>"你好，#{params[:user][:name]}"
     redirect_to center_user_path(:id=>session[:current_user])
   else
     flash[:notice] = "用户名或者密码错误"
     redirect_to "/login" 
   end
  end
  
  def login

  end

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
    @users = User.all
  end
  
  def edit
    
  end

  # GET
  # 通过姓名列出用户的基本信息
  def users_info_by_name
    @users = User.find_all_by_name(params[:name])
    respond_to do |format|
      format.html { render :action => :index }
      format.json  { render :json => @users }
    end
  end

end
