class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :prompt
      t.belongs_to :creator

      t.timestamps null: false
    end

    add_index :questions, :prompt
  end
end
