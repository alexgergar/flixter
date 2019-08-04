class Section < ApplicationRecord
    belongs_to :course
    has_many :lessons

    validates :title, presence: true

    include RankedModel
    ranks :row_order, with_same: :course_id

    def next_section
        section = course.sections.where("row_order > ?", self.row_order).rank(:row_order).first
        return section
    end

    # TOC_num = [0]

    # def toc  
    #     if TOC_num.empty?
    #      last_toc_number = 0
    #     else last_toc_number = TOC_num.last
    #     end 
    #   current_number = last_toc_number + 1
    #   TOC_num.push(current_number)
    #   return current_number
    # end

    # def clear_toc
    #   TOC_num.clear
    # end
     
end

