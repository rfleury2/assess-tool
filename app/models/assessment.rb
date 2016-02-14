class Assessment < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  validates_presence_of :title, :creator

  # has_many :questions, through: :question_answers
end
