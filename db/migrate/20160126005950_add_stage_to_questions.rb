class AddStageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :stage, :string, default: 'draft'
  end
end
