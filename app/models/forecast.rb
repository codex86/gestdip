class Forecast < ActiveRecord::Base
  
  belongs_to :employee
  belongs_to :prefshift
  
  attr_accessible :employee_id, :giorno, :prefshift_id
  
  def self.getPreview(data)
      
    @forecastshifts = self.select("prefshift_id").uniq
    @results = []

    @forecastshifts.each do |forecastshift|
      @results.push(forecastshift)
      @data = data
      7.times do
        result = self.select("employee_id").where("prefshift_id = ? AND giorno = ?", forecastshift.prefshift_id, @data).first
        if result!=nil
          @results.push(result)
        else
          @results.push("")
        end
        @data = @data+1
      end
    end
    return @results
  end
  
end
