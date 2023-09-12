class AlatsController < ApplicationController
  before_action :set_alat, only: %i[ show update destroy ]

  # GET /alats
  def index
    @page = alat_params["page"].present? ? params["page"].to_i : 1
    @limit = alat_params["limit"].present? ? params["limit"].to_i : 10
    @alats = Alat.all.page(@page).per(@limit)
    data_alat = []
    if @alats.present?
      @alats.each do |alat|
        data_array = {
          id: alat._id.to_s,
          nama_alat: alat.nama_alat,
          lokasi: alat.lokasi,
          status: alat.status
        }
        data_alat.push(data_array)
      end
    else
      data_alat = nil
    end
    meta ={
      next_page: @alats.next_page,
      prev_page: @alats.prev_page,
      current_page: @alats.current_page,
      total_pages: @alats.total_pages
    }
    result = {
      status: true,
      messages: 'Sukses',
      content: data_alat,
      meta: meta
    }
    render json: result
  end

  # GET /alats/1
  def show
    render json: @alat
  end

  # POST /alats
  def create
    @alat = Alat.new(alat_params)

    if @alat.save
      render json: {
        status: true,
        message: "Berhasil Simpan",
        content: @alat
      }
    else
      render json: {
        status: false,
        message: "Gagal Simpan",
        content: nil
      }
    end
  end

  # PATCH/PUT /alats/1
  def update
    if @alat.update(alat_params)
      render json: {
        status: true,
        message: "Berhasil Edit",
        content: @alat
      }
    else
      render json: {
        status: false,
        message: "Gagal Edit",
        content: nil
      }
    end
  end

  # DELETE /alats/1
  def destroy
     if @alat.destroy
        render json: {
          status: true,
          message: "Berhasil hapus",
          content: nil
        }
      else
        render json: {
          status: false,
          message: "Gagal hapus",
          content: nil
        }
    end

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
