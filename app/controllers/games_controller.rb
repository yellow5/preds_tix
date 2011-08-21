class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @season = Season.last
    @games  = Game.all(:conditions => { :season_id => @season.id })

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game           = Game.find(params[:id])
    @ticket_holders = TicketHolder.where('season_id = ?', @game.season_id)
    @ticket_holders = @ticket_holders.reject do |ticket_holder|
      ticket_holder if ticket_holder.max_tickets_claimed?
    end

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game    = Game.new
    @seasons = Season.all

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game    = Game.find(params[:id])
    @seasons = Season.all
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game    = Game.find(params[:id])
    @seasons = Season.all

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(@game, :notice => 'Game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end
end
