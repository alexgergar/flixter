class Course < ApplicationRecord
   mount_uploader :image, ImageUploader
   belongs_to :user
   has_many :sections
   
   validates :title, presence: true
   validates :description, presence: true
   validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

    TOC_num = [0]

    def toc  
        if TOC_num.empty?
         last_toc_number = 0
        else last_toc_number = TOC_num.last
        end 
      current_number = last_toc_number + 1
      TOC_num.push(current_number)
      current_number
    end

    def clear_toc
      TOC_num.clear
    end


end
