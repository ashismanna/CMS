class CreateCourseEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :course_enrollments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end
  end
end
