class HomeworksController < ApplicationController
  def new 
    @homework = Homework.new(:topic_id=>params[:topic_id])
  end
  
  def create
    @homework= Homework.new(params[:homework])
    @homework.user = current_user
    @homework.save
  end
end
