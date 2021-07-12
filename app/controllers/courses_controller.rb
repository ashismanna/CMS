class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to courses_path
		else
			redirect_to new_course_path
		end
	end

	def edit
		@course = Course.find params[:id]
	end

	def show
		@course = Course.find params[:id]
	end

	def enroll
		enrollment = current_user.course_enrollments.new
		enrollment.course_id = params[:id]
		enrollment.save
		redirect_to courses_path
	end

	private

	def course_params
		params.require(:course).permit(:title, :description, :content)
	end

end
