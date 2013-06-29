class Contract < ActiveRecord::Base
  
  has_many :employees
  attr_accessible :cod, :descrizione, :nome
end
