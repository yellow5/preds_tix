class SeasonsController < ApplicationController
  # GET /seasons
  # GET /seasons.xml
  def index
    @seasons = Season.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @seasons }
    end
  end

  # GET /seasons/1
  # GET /seasons/1.xml
  def show
    @season = Season.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/new
  # GET /seasons/new.xml
  def new
    @season = Season.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/1/edit
  def edit
    @season = Season.find(params[:id])
  end

  # POST /seasons
  # POST /seasons.xml
  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to(@season, :notice => 'Season was successfully created.') }
        format.xml  { render :xml => @season, :status => :created, :location => @season }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @season.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seasons/1
  # PUT /seasons/1.xml
  def update
    @season = Season.find(params[:id])

    respond_to do |format|
      if @season.update_attributes(season_params)
        format.html { redirect_to(@season, :notice => 'Season was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @season.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def season_params
    params.require(:season).permit(:years)
  end
end
