class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.string :name
      t.timestamps
    end
    types = ["radio", "checkbox", "dropdown", "text"]
    types.each do |t|
      QuestionType.create(:name => t)
    end
  end
end
