class Course < ApplicationRecord
	has_many :course_enrollments
  	has_many :users, through: :course_enrollments
  	has_rich_text :content

  	validates :title, :description, :content, :presence=>true
end
