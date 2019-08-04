class AddCatColstoCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :photography, :boolean
    add_column :courses, :film_production, :boolean
    add_column :courses, :post_production, :boolean
    add_column :courses, :graphic_design, :boolean
    add_column :courses, :ux, :boolean
    add_column :courses, :threed_animation, :boolean
    add_column :courses, :vr, :boolean
  end
end
