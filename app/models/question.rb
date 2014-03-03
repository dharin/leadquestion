class Question < ActiveRecord::Base

  attr_accessor :ans_opt1, :ans_custom_1, :ans_custom_2

  belongs_to :form
  has_many :form_datas
  has_many :answers
  belongs_to :question_type
  accepts_nested_attributes_for :answers , :allow_destroy => true

  # Validations
  validates :question_name, :presence => true, :on => :update
  validates :answer_options, :presence => true, :on => :update
end
