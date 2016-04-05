class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :qst_txt, null: false
      t.string :a, null: false
      t.string :b, null: false
      t.timestamps null: false
    end
  end
end
