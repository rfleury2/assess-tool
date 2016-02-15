class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :answers, dependent: :destroy

  has_and_belongs_to_many :assessments

  validates_presence_of :prompt

  def has_correct_answer?
    self.answers.pluck(:correct).include?(true)
  end

  def answer_count
    answers.count
  end
end
