class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrollment_for_current_lesson

	def create
		@lessons = current_lesson.section.course(course params)
		if @lesson.valid?
			redirect_to_instructor_courses_path(@lessons)
		end
	end

	def show
		@lesson = Lesson.find(params[:id])
	end

	private

  	def require_enrollment_for_current_lesson
    	if !current_user.enrolled_in?(current_lesson.section.course)
      		redirect_to course_path(current_lesson.section.course), alert: "You must be enrolled to view this lesson."
      	end
    end


  	helper_method :current_lesson
  	def current_lesson
    	@current_lesson ||= Lesson.find(params[:id])
  	end
end
