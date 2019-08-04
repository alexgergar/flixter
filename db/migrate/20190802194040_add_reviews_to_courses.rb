class AddReviewsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :rating, :float
  end
end
