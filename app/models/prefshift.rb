class Prefshift < ActiveRecord::Base
  
  has_one :forecast
  
  has_many :employee_prefshifts, :dependent => :destroy
  has_many :employees, through: :employee_prefshifts, :dependent => :destroy
  
  has_many :ggsettimana_prefshifts, :dependent => :destroy
  has_many :ggsettimanas, through: :ggsettimana_prefshifts, :dependent => :destroy
  
  attr_accessible :cod, :descr, :fine, :inizio, :nome, :stato, :ggsettimana_ids
  
  after_initialize do
    self.stato ||= true
    self.inizio ||= Date.new(2000,1,1)
    self.fine ||= Date.new(2000,1,1)
  end
    
end
