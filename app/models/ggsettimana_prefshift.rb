class GgsettimanaPrefshift < ActiveRecord::Base
  
  belongs_to :ggsettimana
  belongs_to :prefshift
  
  attr_accessible :ggsettimana_id, :prefshift_id
end
