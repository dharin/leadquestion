class FormData < ActiveRecord::Base
  belongs_to :question
  belongs_to :visit
end
