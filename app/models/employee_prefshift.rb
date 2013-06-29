class EmployeePrefshift < ActiveRecord::Base
  
  belongs_to :employee
  belongs_to :prefshift
  
  attr_accessible :employee_id, :prefshift_id
end
