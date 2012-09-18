module UserHelper
  def user_menu current_user
    case current_user.identity
    when "学生"
      student_menu
    when "教师"
      professor_menu
    end
  end
  
  def student_menu
  end
  
  def  professor_menu
    render :partial=>"users/professor_menu"
  end
end
