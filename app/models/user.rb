class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :set_user_type

  #associations
  has_many :course_enrollments
  has_many :courses, through: :course_enrollments

  def set_user_type
    self.update(:user_type => "student")
  end

  def can_create_course?
    user_type=="admin"
  end

end
