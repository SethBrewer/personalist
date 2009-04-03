class MyersBriggsTypesController < ApplicationController
  
  before_filter :authorize_or_signup, :only => :create
  before_filter :authorize, :except => [:show, :new]
  
  # GET /myers_briggs_types
  # GET /myers_briggs_types.xml
  def index
    @myers_briggs_types = MyersBriggsType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @myers_briggs_types }
    end
  end

  # GET /myers_briggs_types/1
  # GET /myers_briggs_types/1.xml
  def show
    @myers_briggs_type = MyersBriggsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @myers_briggs_type }
    end
  end

  # GET /myers_briggs_types/new
  # GET /myers_briggs_types/new.xml
  def new
    @myers_briggs_type = MyersBriggsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @myers_briggs_type }
    end
  end

  # GET /myers_briggs_types/1/edit
  def edit
    @myers_briggs_type = MyersBriggsType.find(params[:id])
  end

  # POST /myers_briggs_types
  # POST /myers_briggs_types.xml
  def create
    @myers_briggs_type = MyersBriggsType.new(params[:myers_briggs_type])

    respond_to do |format|
      if @myers_briggs_type.save
        flash[:notice] = 'Myers Briggs Type was successfully created.'
        format.html { redirect_to(@myers_briggs_type) }
        format.xml  { render :xml => @myers_briggs_type, :status => :created, :location => @myers_briggs_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @myers_briggs_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /myers_briggs_types/1
  # PUT /myers_briggs_types/1.xml
  def update
    @myers_briggs_type = MyersBriggsType.find(params[:id])

    respond_to do |format|
      if @myers_briggs_type.update_attributes(params[:myers_briggs_type])
        flash[:notice] = 'Myers Briggs Type was successfully updated.'
        format.html { redirect_to(@myers_briggs_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @myers_briggs_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /myers_briggs_types/1
  # DELETE /myers_briggs_types/1.xml
  def destroy
    @myers_briggs_type = MyersBriggsType.find(params[:id])
    @myers_briggs_type.destroy

    respond_to do |format|
      format.html { redirect_to(myers_briggs_types_url) }
      format.xml  { head :ok }
    end
  end
end
