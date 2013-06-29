class StatsController < ApplicationController
  
  def index
    
    @data = Date.today.beginning_of_month
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def create
    if(Date.valid_date?(params[:data]['year'].to_i,params[:data]['month'].to_i,params[:data]['day'].to_i))
    
      @data = Date.new(params[:data]['year'].to_i,params[:data]['month'].to_i,params[:data]['day'].to_i)
      @employees = Employee.order("dataAssunzione ASC").all
      @forecasts = Forecast.where("giorno > ? AND giorno < ?", @data-1, @data.end_of_month+1).all
      
      @array = Array.new
      
      @employees.each do |employee|
        @min = 0
        @numturni = 0
        
        @forecasts.each do |forecast|
          if(employee.id == forecast.employee_id)
            @min = @min + calcmin(forecast.prefshift.inizio, forecast.prefshift.fine)
            @numturni = @numturni + 1
          end
        end
        @ore = ((@min/60)).to_i
        @min = (@min - (@ore*60) ).to_i
        @tempo = @ore.to_s+":"+@min.to_s
        @emp = [employee, @tempo, @numturni]
        @array.push(@emp)
      end
       render :action => 'show', :array => @array
    else
      render :action => 'index'
    end
  end

  def calcmin(inizio, fine)
    
    hour_partin = inizio.hour * 60 
    minute_partin = inizio.min 
    iniziosec = hour_partin + minute_partin
    
    hour_partfin = fine.hour * 60 
    minute_partfin = fine.min 
    finesec = hour_partfin + minute_partfin
    
    totale = finesec - iniziosec
    
    if totale < 0
      totale = (1440 - iniziosec) + (0 + finesec)
    end
    return totale
  end
  
  def dettaglio (id)
    
  end

end