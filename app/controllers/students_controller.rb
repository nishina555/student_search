class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @departments = Department.all
    @subjects = Subject.all
    @students = @q.result(distinct: true).includes(:department, :subjects)
  end

  def search
    @q = Student.search(search_params)
    @students = @q.result(distinct: true).includes(:department, :subjects)
    @search_query = params[:q]
  end

  private
  def search_params
    params.require(:q).permit(:name_cont, :department_id_eq, :sex_eq, :age_gteq, :subjects_id_in => [])
  end

end
