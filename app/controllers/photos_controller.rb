class PhotosController < ApplicationController
  def index
	  @photos = Photo.page(params[:page]).per(5)
  end

  def new
      @photo = Photo.new
  end

  def create
      @photo = Photo.new(photo_params)

      respond_to do |format|
        if @photo.save
          format.html { render :show, notice: 'photo uploaded'}
          format.json { render :show, status: :created, location: @show}
        else
          format.html { render :new}
          format.json { render json: @photo.errors, status: :unprocessable_entity}
        end
      end
  end

  def show
  end

  private

  def photo_params
    params.require(:photo).permit(:avatar)
  end
end
