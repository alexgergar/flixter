class DropCategoryCatCourseTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories
    drop_table :categories_courses
  end
end
