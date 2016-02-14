class CreateJoinTableQuestionAssessment < ActiveRecord::Migration
  def change
    create_join_table :questions, :assessments do |t|
      # t.index [:question_id, :assessment_id]
      # t.index [:assessment_id, :question_id]
    end
  end
end
