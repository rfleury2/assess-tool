class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :title
      t.belongs_to :creator

      t.timestamps null: false
    end
  end
end
