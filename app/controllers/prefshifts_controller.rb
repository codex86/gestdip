class PrefshiftsController < ApplicationController
  # GET /prefshifts
  # GET /prefshifts.json
  def index
    @prefshifts = Prefshift.order("inizio").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prefshifts }
    end
  end

  # GET /prefshifts/1
  # GET /prefshifts/1.json
  def show
    @prefshift = Prefshift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prefshift }
    end
  end

  # GET /prefshifts/new
  # GET /prefshifts/new.json
  def new
    @prefshift = Prefshift.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prefshift }
    end
  end

  # GET /prefshifts/1/edit
  def edit
    @prefshift = Prefshift.find(params[:id])
  end

  # POST /prefshifts
  # POST /prefshifts.json
  def create
    @prefshift = Prefshift.new(params[:prefshift])

    respond_to do |format|
      if @prefshift.save
        format.html { redirect_to @prefshift, notice: 'Prefshift was successfully created.' }
        format.json { render json: @prefshift, status: :created, location: @prefshift }
      else
        format.html { render action: "new" }
        format.json { render json: @prefshift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prefshifts/1
  # PUT /prefshifts/1.json
  def update
    @prefshift = Prefshift.find(params[:id])

    respond_to do |format|
      if @prefshift.update_attributes(params[:prefshift])
        format.html { redirect_to @prefshift, notice: 'Prefshift was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prefshift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefshifts/1
  # DELETE /prefshifts/1.json
  def destroy
    @prefshift = Prefshift.find(params[:id])
    @prefshift.destroy

    respond_to do |format|
      format.html { redirect_to prefshifts_url }
      format.json { head :no_content }
    end
  end
end
