class MainController < ApplicationController

  before_filter :authorize_or_signup, :only => :create
  before_filter :authorize, :except => [:show, :new]

  # GET /persona_teams
  # GET /persona_teams.xml
  def index
  
	@persona_teams = PersonaTeam.find(:all, :conditions => ['account_id = ?', session[:account_id]])
  @account = Account.find(:all, :conditions => ['id = ?', session[:account_id]])

    respond_to do |format|
      format.html # index.html.erb
	  format.xml  { render :xml => @account }
      format.xml  { render :xml => @persona_teams }
    end
  end

  # GET /persona_teams/1
  # GET /persona_teams/1.xml
  def show
    @persona_team = PersonaTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @persona_team }
    end
  end

  # GET /persona_teams/new
  # GET /persona_teams/new.xml
  def new
    @persona_team = PersonaTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @persona_team }
    end
  end

  # GET /persona_teams/1/edit
  def edit
    @persona_team = PersonaTeam.find(params[:id])
  end

  # POST /persona_teams
  # POST /persona_teams.xml
  def create
    @persona_team = PersonaTeam.new(params[:persona_team])

    respond_to do |format|
      if @persona_team.save
        flash[:notice] = 'Industry Type was successfully created.'
        format.html { redirect_to(@persona_team) }
        format.xml  { render :xml => @persona_team, :status => :created, :location => @persona_team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @persona_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /persona_teams/1
  # PUT /persona_teams/1.xml
  def update
    @persona_team = PersonaTeam.find(params[:id])

    respond_to do |format|
      if @persona_team.update_attributes(params[:persona_team])
        flash[:notice] = 'Industry Type was successfully updated.'
        format.html { redirect_to(@persona_team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @persona_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /persona_teams/1
  # DELETE /persona_teams/1.xml
  def destroy
    @persona_team = PersonaTeam.find(params[:id])
    @persona_team.destroy

    respond_to do |format|
      format.html { redirect_to(persona_teams_url) }
      format.xml  { head :ok }
    end
  end
end
