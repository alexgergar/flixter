class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
        puts "#{current_user.email} ^^^^^^^^^^^^^^^^^^^"
    end

end
