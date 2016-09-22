class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy]

  def show
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /photos/update_order
  def update_order
  	@photo = Photo.find(params[:photo_id])
  	@photo.rank_order_position = params[:rank_order_position]
  	@photo.save
  	
  	render nothing: true
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to edit_property_path(@photo.property), 
      				notice: 'Photo was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :photo_id, :rank_order_position)
    end
end
