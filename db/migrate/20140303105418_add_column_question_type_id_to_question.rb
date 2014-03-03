class AddColumnQuestionTypeIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question_type_id, :integer
    add_column :questions, :answer_options, :string
  end
end
