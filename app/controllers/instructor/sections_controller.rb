class Instructor::SectionsController < ApplicationController
    def new
        @course = Course.find(params[:course_id])
        @section = Section.new
    end

    def create
        @course = Course.find(params[:course_id])
        @section = @course.sections.create(section_params)
         if @section.valid?
            redirect_to instructor_course_path(@course)
         else
             render :new, status: :unprocessable_entity
         end
    end

    private

    def section_params
        params.require(:section).permit(:title, :description)
    end
end
