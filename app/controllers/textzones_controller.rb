
class TextzonesController < ApplicationController
  before_action :set_textzone, only: [:show, :update, :destroy]
  before_action :set_yolo, only: [:yolo]
  before_action :set_yolo_patch, only: [:yolopatch]

  # GET /textzones
  def index
    @textzones = Textzone.all

    render json: @textzones
  end

  # GET /textzones/1
  def show
    render json: @textzone
  end

  # GET /textzones/1
  def yolo
    _preformat = @textzone.select(:id_page, :id_textzone, :lang, :content)
    _renderformat = Hash.new
    _preformat.each do |i|
      _renderformat[i.id_textzone] = i.content
    end
    render json: _renderformat
  end

  # PATCH/PUT /textzones/1
  def yolopatch
    if @textzone.exists?
      if @textzone.update(modifzone_params)
        render json: @textzone
      else
        render json: @textzone.errors, status: :unprocessable_entity
      end
    else
      @textzone = Textzone.new(textzone_params)
      if @textzone.save
        render json: @textzone, status: :created, location: @textzone
      else
        render json: @textzone.errors, status: :unprocessable_entity
      end
    end
  end

  # POST /textzones
  def create
    @textzone = Textzone.new(textzone_params)

    if @textzone.save
      render json: @textzone, status: :created, location: @textzone
    else
      render json: @textzone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /textzones/1
  def update
    if @textzone.update(textzone_params)
      render json: @textzone
    else
      render json: @textzone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /textzones/1
  def destroy
    @textzone.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_textzone
    @textzone = Textzone.find(params[:id])
  end

  def set_yolo
    @textzone = Textzone.where(lang: params[:lang], id_page: params[:id_page])
  end

  def set_yolo_patch
    @textzone = Textzone.where(lang: params[:lang], id_page: params[:id_page], id_textzone: params[:id_textzone])
  end

  # Only allow a trusted parameter "white list" through.
  def textzone_params
    params.require(:textzone).permit(:id_page, :id_textzone, :lang, :content)
  end

  def modifzone_params
    params.permit(:id_page, :id_textzone, :lang, :content)
  end
end
