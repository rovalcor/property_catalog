class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
  	#Order properties in case of a search query
    unless params[:search] == nil
    	@properties = Property.search(params[:search],params[:search_type]).order("created_at desc")
    else
    	 @properties = Property.all.order("created_at desc")
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  	@property_photos = @property.photos.rank(:rank_order)
  end

  # GET /properties/new
  def new
    @property = Property.new
    @photos = @property.photos.build
    @new_flag = true
    
  end

  # GET /properties/1/edit
  def edit
  	@property_photos = @property.photos.rank(:rank_order)
  	@new_flag = false
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
      	#If photos were uploaded, parameters for each one will be posted separately
      	unless params[:photos] == nil
      		params[:photos]['image'].each do |p|
      			@property.photos.create!(image: p)
      		end
      		@property.photos.rank(:rank_order)
      	end
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property }
      else
        format.html { render action: 'new' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
      #If photos were uploaded, parameters for each one will be posted separately
      	unless params[:photos] == nil
      		params[:photos]['image'].each do |p|
      			@property.photos.create!(image: p)
      		end
      		@property.photos.rank(:rank_order)
      	end
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :property_type, :description, feature_ids:[], photos_attributes: [:image])
    end
end
