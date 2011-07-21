class HomeworksController < ApplicationController
  def index 
    Homework.all
  end
end
