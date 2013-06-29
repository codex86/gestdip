class Ggsettimana < ActiveRecord::Base
  
  has_many :ggsettimana_prefshifts, :dependent => :destroy
  has_many :ggsettimanas, through: :ggsettimana_prefshifts, :dependent => :destroy
  
  attr_accessible :gg
end
