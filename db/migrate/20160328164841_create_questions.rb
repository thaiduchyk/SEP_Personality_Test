class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :qst_txt
      t.string :a
      t.string :b
      t.timestamps null: false
    end
  end
end
