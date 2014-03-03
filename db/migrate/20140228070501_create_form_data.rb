class CreateFormData < ActiveRecord::Migration
  def change
    create_table :form_data do |t|
      t.integer :question_id
      t.string :answer
      t.integer :visit_id

      t.timestamps
    end
  end
end
