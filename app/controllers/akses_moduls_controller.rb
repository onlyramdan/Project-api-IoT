class AksesModulsController < ApplicationController
  before_action :set_akses_modul, only: %i[ show update destroy ]

  # GET /akses_moduls
  def index
    @akses_moduls = AksesModul.all

    render json: @akses_moduls
  end

  # GET /akses_moduls/1
  def show
    render json: @akses_modul
  end

  # POST /akses_moduls
  def create
    @akses_modul = AksesModul.new(akses_modul_params)

    if @akses_modul.save
      render json: @akses_modul, status: :created, location: @akses_modul
    else
      render json: @akses_modul.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /akses_moduls/1
  def update
    if @akses_modul.update(akses_modul_params)
      render json: @akses_modul
    else
      render json: @akses_modul.errors, status: :unprocessable_entity
    end
  end

  # DELETE /akses_moduls/1
  def destroy
    @akses_modul.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_akses_modul
      @akses_modul = AksesModul.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def akses_modul_params
      params.permit(:user_role_id, :modul_id ,:id)
    end
end
