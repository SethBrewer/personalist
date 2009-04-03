class PersonaTeamRostersController < ApplicationController
  
  before_filter :authorize_or_signup, :only => :create
  before_filter :authorize, :except => [:show, :new]

  # GET /persona_team_rosters
  # GET /persona_team_rosters.xml
  def index
  
	@persona_teams = PersonaTeam.find(:all, :conditions => ['account_id = ?', session[:account_id]])
	@persona_team_rosters = @persona_teams.PersonaTeamRoster.Persona.LastName
	@personas = Persona.find(:all, :conditions => ['status = ?', 'public'])
    # @persona_team_rosters = PersonaTeamRoster.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @persona_team_rosters }
    end
  end

  # GET /persona_team_rosters/1
  # GET /persona_team_rosters/1.xml
  def show
    @persona_team_roster = PersonaTeamRoster.find(params[:id])
    @personas = [@persona_team_roster.persona(:all)]


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @persona_team_roster }
    end
  end

  # GET /persona_team_rosters/new
  # GET /persona_team_rosters/new.xml
  def new
    @persona_team_roster = PersonaTeamRoster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @persona_team_roster }
    end
  end

  # GET /persona_team_rosters/1/edit
  def edit
    @persona_team_roster = PersonaTeamRoster.find(params[:id])
  end

  # POST /persona_team_rosters
  # POST /persona_team_rosters.xml
  def create
    @persona_team_roster = PersonaTeamRoster.new(params[:persona_team_roster])

    respond_to do |format|
      if @persona_team_roster.save
        flash[:notice] = 'Persona team roster was successfully created.'
        format.html { redirect_to(@persona_team_roster) }
        format.xml  { render :xml => @persona_team_roster, :status => :created, :location => @persona_team_roster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @persona_team_roster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /persona_team_rosters/1
  # PUT /persona_team_rosters/1.xml
  def update
    @persona_team_roster = PersonaTeamRoster.find(params[:id])

    respond_to do |format|
      if @persona_team_roster.update_attributes(params[:persona_team_roster])
        flash[:notice] = 'Persona team roster was successfully updated.'
        format.html { redirect_to(@persona_team_roster) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @persona_team_roster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /persona_team_rosters/1
  # DELETE /persona_team_rosters/1.xml
  def destroy
    @persona_team_roster = PersonaTeamRoster.find(params[:id])
    @persona_team_roster.destroy

    respond_to do |format|
      format.html { redirect_to(persona_team_rosters_url) }
      format.xml  { head :ok }
    end
  end
end
