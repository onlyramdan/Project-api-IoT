class AlatsController < ApplicationController
  before_action :set_alat, only: %i[ show update destroy ]

  # GET /alats
  def index
    @alats = Alat.all

    render json: @alats
  end

  # GET /alats/1
  def show
    render json: @alat
  end

  # POST /alats
  def create
    @alat = Alat.new(alat_params)

    if @alat.save
      render json: @alat, status: :created, location: @alat
    else
      render json: @alat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alats/1
  def update
    if @alat.update(alat_params)
      render json: @alat
    else
      render json: @alat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alats/1
  def destroy
    @alat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alat
      @alat = Alat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alat_params
      # params.require(:alat).permit(:nama_alat, :lokasi, :status)
      params.permit(:nama_alat, :lokasi, :status, :id)

    end
end
