class AddGraduationYearAndCourseToAboutAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :about_amitians, :graduation_year, :int
    add_column :about_amitians, :course, :string
  end
end
