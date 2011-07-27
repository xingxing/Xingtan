class HomeworksController < ApplicationController
  def index
    @homeworks = User.find(params[:user_id]).homeworks if params[:user_id]
    @homeworks ||= Homework.all
  end

  def new 
    @homework = Homework.new(:topic_id=>params[:topic_id])
  end
  
  def edit
    @homework = Homework.find(params[:id])
    render :action=>:new
  end

  def update
    @homework = Homework.find(params[:id])
    if @homework.update_attributes(params[:homework])
      redirect_to @homework,:notice=>"成功修改作业"
    else
      render :action=>:eidt
    end
  end

  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to(request.request_uri) }
      format.xml  { head :ok }
    end
  end

  
  def create
    @homework= Homework.new(params[:homework])
    @homework.user = current_user
    @homework.save
  end
end
