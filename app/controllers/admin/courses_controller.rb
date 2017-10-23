class Admin::CoursesController < ApplicationController

  before_action :find_course, only: [:edit, :update]

  def index
    @course = Course.last || Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to root_path
    else
      redirect_to :back, notice: "Course wasn't update"
    end
  end


  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.required(:course).permit(:value, :valid_to)
  end

end