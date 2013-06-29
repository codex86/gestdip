class Employee < ActiveRecord::Base
  
  belongs_to :contract
  has_one :forecast
  
  has_many :employee_prefshifts, :dependent => :destroy
  has_many :prefshifts, through: :employee_prefshifts, :dependent => :destroy

  attr_accessible :acceso, :cognome, :contract_id, :dataAssunzione, :malattia, :matricola, :nome, :prefshift_ids

  after_initialize do
    self.acceso ||= true
  end
end
