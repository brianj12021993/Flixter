class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_lessons, only: [:show]

	def create
		@lessons = current_lesson.section.course(course params)
			if @lesson.valid?
				redirect_to_instructor_courses_path(@lessons)
	end

	def show
		@lesson = Lessons.find(params[:id])
	end

	private

  	def require_authorized_for_current_lesson
    	if current_lesson.user != current_user
      		redirect_to course_sections, alert: 'Error Message Here'
    	end
      end
  	end

  	helper_method :current_lesson
  	def current_lesson
    	@current_lesson ||= Lesson.find(params[:id])
  	end
end
