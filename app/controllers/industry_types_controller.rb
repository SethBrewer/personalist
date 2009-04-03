class IndustryTypesController < ApplicationController

  before_filter :authorize_or_signup, :only => :create
  before_filter :authorize, :except => [:show, :new]

    # GET /industry_types
    # GET /industry_types.xml
    def index
      @industry_types = IndustryType.find(:all)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @industry_types }
      end
    end

    # GET /industry_types/1
    # GET /industry_types/1.xml
    def show
      @industry_type = IndustryType.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @industry_type }
      end
    end

    # GET /industry_types/new
    # GET /industry_types/new.xml
    def new
      @industry_type = IndustryType.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @industry_type }
      end
    end

    # GET /industry_types/1/edit
    def edit
      @industry_type = IndustryType.find(params[:id])
    end

    # POST /industry_types
    # POST /industry_types.xml
    def create
      @industry_type = IndustryType.new(params[:industry_type])

      respond_to do |format|
        if @industry_type.save
          flash[:notice] = 'Industry Type was successfully created.'
          format.html { redirect_to(@industry_type) }
          format.xml  { render :xml => @industry_type, :status => :created, :location => @industry_type }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @industry_type.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /industry_types/1
    # PUT /industry_types/1.xml
    def update
      @industry_type = IndustryType.find(params[:id])

      respond_to do |format|
        if @industry_type.update_attributes(params[:industry_type])
          flash[:notice] = 'Industry Type was successfully updated.'
          format.html { redirect_to(@industry_type) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @industry_type.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /industry_types/1
    # DELETE /industry_types/1.xml
    def destroy
      @industry_type = IndustryType.find(params[:id])
      @industry_type.destroy

      respond_to do |format|
        format.html { redirect_to(industry_types_url) }
        format.xml  { head :ok }
      end
    end
  end
