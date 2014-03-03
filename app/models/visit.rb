class Visit < ActiveRecord::Base
  ## Relationships
  belongs_to :lead
  has_many :form_datas
  ## Validations

  ## Class Methods

  ## Instance Methods

end
