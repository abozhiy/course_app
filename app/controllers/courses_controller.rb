class CoursesController < ApplicationController
  before_action :find_course, only: [:show]

  def show
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end
end