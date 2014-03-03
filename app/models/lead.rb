class Lead < ActiveRecord::Base

  ## Relationships
  has_many :visits
  belongs_to :provider

  attr_accessor :ipaddress

  accepts_nested_attributes_for :visits , :allow_destroy => true

  ## Validations

  ## Class Methods

  ## Instance Methods


end
