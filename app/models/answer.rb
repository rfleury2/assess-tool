class Answer < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :content
  validates_inclusion_of :correct, in: [true, false]
  validates_presence_of :question_id
end
