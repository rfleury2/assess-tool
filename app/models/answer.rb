class Answer < ActiveRecord::Base
  belongs_to :question

  default_scope { order("created_at ASC") }

  validates_presence_of :content
  validates_inclusion_of :correct, in: [true, false]
  validates_presence_of :question_id

  # TODO: Disabled validation because it fails on allowing re-inclusion
  # of a previously deleted answer
  # validates_uniqueness_of :content, scoped_to: :question_id, on: :create
end
