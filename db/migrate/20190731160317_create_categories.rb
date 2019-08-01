class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_id
      t.integer  :course_id
      t.timestamps
    end
    add_index :categories, [:category_id, :course_id]
  end
end
