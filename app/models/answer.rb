class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer, :presence => true, :on => :update
  

end
