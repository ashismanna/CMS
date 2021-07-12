class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #associations
  has_many :course_enrollments
  has_many :courses, through: :course_enrollments

  def can_enroll_course?
    user_type=="student"
  end

  def has_enrolled?(course)
    course_enrollment =  self.course_enrollments.where(:course_id=>course.id)
    course_enrollment and course_enrollment.any?
  end

  def admin?
    user_type=="admin"
  end


end
