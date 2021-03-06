class TicketHoldersController < ApplicationController
  # GET /ticket_holders
  # GET /ticket_holders.xml
  def index
    @ticket_holders = TicketHolder.all
    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @ticket_holders }
    end
  end

  # GET /ticket_holders/1
  # GET /ticket_holders/1.xml
  def show
    @ticket_holder = TicketHolder.find(params[:id])
    @games         = @ticket_holder.games

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @ticket_holder }
    end
  end

  # GET /ticket_holders/new
  # GET /ticket_holders/new.xml
  def new
    @ticket_holder = TicketHolder.new
    @seasons       = Season.all

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @ticket_holder }
    end
  end

  # GET /ticket_holders/1/edit
  def edit
    @ticket_holder = TicketHolder.find(params[:id])
    @seasons       = Season.all
  end

  # POST /ticket_holders
  # POST /ticket_holders.xml
  def create
    @ticket_holder = TicketHolder.new(ticket_holder_params)

    respond_to do |format|
      if @ticket_holder.save
        format.html { redirect_to(@ticket_holder, :notice => 'Ticket holder was successfully created.') }
        format.xml  { render :xml => @ticket_holder, :status => :created, :location => @ticket_holder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket_holder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_holders/1
  # PUT /ticket_holders/1.xml
  def update
    @ticket_holder = TicketHolder.find(params[:id])
    @seasons       = Season.all

    respond_to do |format|
      if @ticket_holder.update_attributes(ticket_holder_params)
        format.html { redirect_to(@ticket_holder, :notice => 'Ticket holder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket_holder.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def ticket_holder_params
    params.require(:ticket_holder).permit(:season_id, :name)
  end
end
