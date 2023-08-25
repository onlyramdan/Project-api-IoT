class ModulsController < ApplicationController
  before_action :set_modul, only: %i[ show update destroy ]

  # GET /moduls
  def index
    @moduls = Modul.all

    render json: @moduls
  end

  # GET /moduls/1
  def show
    render json: @modul
  end

  # POST /moduls
  def create
    @modul = Modul.new(modul_params)

    if @modul.save
      render json: @modul, status: :created, location: @modul
    else
      render json: @modul.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /moduls/1
  def update
    if @modul.update(modul_params)
      render json: @modul
    else
      render json: @modul.errors, status: :unprocessable_entity
    end
  end

  # DELETE /moduls/1
  def destroy
    @modul.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modul
      @modul = Modul.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def modul_params
      params.permit(:nama, :url, :status ,:id)
    end
end
