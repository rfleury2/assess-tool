class Answer < ActiveRecord::Base
  belongs_to :question

  default_scope { order("created_at ASC") }

  validates_presence_of :content
  validates_inclusion_of :correct, in: [true, false]
  validates_presence_of :question_id

  # validates_uniqueness_of :content, scoped_to: :question_id, on: :create
end
