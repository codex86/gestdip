class GgsettimanasController < ApplicationController
  # GET /ggsettimanas
  # GET /ggsettimanas.json
  def index
    @ggsettimanas = Ggsettimana.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ggsettimanas }
    end
  end

  # GET /ggsettimanas/1
  # GET /ggsettimanas/1.json
  def show
    @ggsettimana = Ggsettimana.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ggsettimana }
    end
  end

  # GET /ggsettimanas/new
  # GET /ggsettimanas/new.json
  def new
    @ggsettimana = Ggsettimana.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ggsettimana }
    end
  end

  # GET /ggsettimanas/1/edit
  def edit
    @ggsettimana = Ggsettimana.find(params[:id])
  end

  # POST /ggsettimanas
  # POST /ggsettimanas.json
  def create
    @ggsettimana = Ggsettimana.new(params[:ggsettimana])

    respond_to do |format|
      if @ggsettimana.save
        format.html { redirect_to @ggsettimana, notice: 'Ggsettimana was successfully created.' }
        format.json { render json: @ggsettimana, status: :created, location: @ggsettimana }
      else
        format.html { render action: "new" }
        format.json { render json: @ggsettimana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ggsettimanas/1
  # PUT /ggsettimanas/1.json
  def update
    @ggsettimana = Ggsettimana.find(params[:id])

    respond_to do |format|
      if @ggsettimana.update_attributes(params[:ggsettimana])
        format.html { redirect_to @ggsettimana, notice: 'Ggsettimana was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ggsettimana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ggsettimanas/1
  # DELETE /ggsettimanas/1.json
  def destroy
    @ggsettimana = Ggsettimana.find(params[:id])
    @ggsettimana.destroy

    respond_to do |format|
      format.html { redirect_to ggsettimanas_url }
      format.json { head :no_content }
    end
  end
end
