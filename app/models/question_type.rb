class QuestionType < ActiveRecord::Base
  has_many :questions

  scope :option2, where("name = ? or name = ?", "radio", "checkbox")
  scope :option2plus, where("name = ? or name = ?", "dropdown", "radio")

end
