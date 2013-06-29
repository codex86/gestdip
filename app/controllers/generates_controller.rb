class GeneratesController < ApplicationController
  
  def index
    @employees = Employee.where("acceso = ? AND malattia = ?", true, false).order("dataAssunzione ASC").all
    @prefshifts = Prefshift.where("stato = ?", true).order("inizio ASC").all
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  #imposta la data da cui iniziare a generare
  def new
    @data = Date.today+1
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def create
    
    #se la data è valida
    if(Date.valid_date?(params[:data]['year'].to_i,params[:data]['month'].to_i,params[:data]['day'].to_i))
    
      @data = Date.new(params[:data]['year'].to_i,params[:data]['month'].to_i,params[:data]['day'].to_i)
    
      @employees = Employee.where("acceso = ? AND malattia = ?", true, false).order("dataAssunzione ASC").all
      @prefshifts = Prefshift.where("stato = ?", true).order("inizio").all
    
      #Per 1 settimana
      7.times do
        @employees = balance(@employees, @data)
        #vedo tutti i turni del giorno
        @employees.each do |dip|
        end
        @prefshifts.each do |shift|
          @employees = searchDip(shift, @data, @employees, @prefshift)
        end
        @data = @data+1
      end 
      
      show(Date.new(params[:data]['year'].to_i,params[:data]['month'].to_i,params[:data]['day'].to_i))
    else
      render :action => 'new'
    end
  end
  
  def searchDip(shift, data, employees, prefshift)
   
    @forecasts = Forecast.where("giorno = ?", data-1).all
    #per tutti i giorni in cui il turno e valido
    shift.ggsettimanas.each do |gg|
      
      #se trovo il giorno valido 
      if (gg.id == data.cwday )
        
        #cerco un dip valido
        employees.each do |dip|
          dip.prefshifts.each do |dipshift|
            
            if (shift.id == dipshift.id)
              logger.debug "Guardia valida : "+dip.matricola
              lastforecasts = @forecasts.last(2)
              unless(lastforecasts.include?(dip))
                logger.debug "Guardia non ha lavorato : "+dip.matricola
                forecast = Forecast.new( :giorno => data, :prefshift_id => shift.id, :employee_id => dip.id)
                if forecast.save
                  employees.delete(dip)
                  employees.push(dip)
                  return employees
                else
                  render :action => 'new'
                end
              end
            end
          end
        end
      end
    end
    return employees
  end
  
  def balance(employees, data)
    
    @forecasts = Forecast.where("giorno = ?", data-1).all
    iniziomese = data.beginning_of_month
    
    #se la data è uguale all'inizio del mese 
    if data === iniziomese
      #Ordina in modo casuale i dip
      employees = employees.shuffle
    
      #se invece non siamo all'inizio del mese
      #allora bisogna anche bilanciare i dip 
      #in base alle ore lavorate
    else
      @forecasts = Forecast.where("giorno >= ?", data.beginning_of_month).all
      
      array = Array.new
      
      #Per tutti i dipendenti calcola i minuti lavorati dall'inizio del mese
      employees.each do |employee|
        min=0  
        @forecasts.each do |forecast|
          if(employee.id == forecast.employee.id)
            
            min = calcmin(forecast.prefshift.inizio, forecast.prefshift.fine) + min
          end
        end
        tmp = [employee,min]
        array.push(tmp)
      end
      
      array = array.sort {|a,b| a[1] <=> b[1]}
      
      employees = []
      array.each do |arr|
        employees.push(arr.at(0))
      end
    end
    return employees
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
  
  def show(data)
     @results = Forecast.getPreview(data)
     
     render :action => 'show'
  end
end