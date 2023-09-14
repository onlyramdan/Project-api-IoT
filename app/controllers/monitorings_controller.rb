class MonitoringsController < ApplicationController
  before_action :set_monitoring, only: %i[ show update destroy ]
  # GET /monitorings
  def index
    @page = monitoring_params["page"].present? ? params["page"].to_i : 1
    @limit = monitoring_params["limit"].present? ? params["limit"].to_i : 10
    # data monitoring
    @monitorings = Monitoring.all.page(@page).per(@limit)
    data_monitoring = []
    if @monitorings.present?
      @monitorings.each do |monitoring|
      data_array = {
        waktu: monitoring.created_at,
        suhu: monitoring.suhu,
        kelembaban: monitoring.kelembaban,
        kebisingan: monitoring.kebisingan,
        lux: monitoring.lux,
        debu: monitoring.debu,
        amonia: monitoring.amonia,
        alat: monitoring.alat.nama_alat
      }
      data_monitoring.push(data_array)
      end
    else
      data_monitoring = nil
    end
    meta ={
      next_page: @monitorings.next_page,
      prev_page: @monitorings.prev_page,
      current_page: @monitorings.current_page,
      total_pages: @monitorings.total_pages
    }
    result = {
      status: true,
      messages: 'Sukses',
      content: data_monitoring,
      meta: meta
    }
    render json: result
  end
  def get_data
    data_monitoring = Monitoring.where(created_at: params['tgl_mulai']..params['tgl_akhir'])
    data = []
    if data_monitoring.present?
      data_monitoring.each do |monitoring|
        array = {
          tanggal: (monitoring.created_at.to_time).strftime("%Y-%m-%d"),
          jam: (monitoring.created_at.to_time).strftime("%H:%M:%S"),
          suhu: monitoring.suhu,
          kelembaban: monitoring.kelembaban,
          kebisingan: monitoring.kebisingan,
          lux: monitoring.lux,
          debu: monitoring.debu,
          amonia: monitoring.amonia,
          alat: monitoring.alat.nama_alat
        }
        data.push(array)
      end  
    else
      data = nil
    end
    render json: {
      status: true,
      messages: 'Sukses',
      content: data,
    }
  end
# GET /monitorings/1
  def show
    render json: @monitoring
  end

  #GET /monitorings/alats/1
  def show_monitoring
    data_monitoring = Monitoring.where(alat_id: params['alat_id'])
    data = []
    if data_monitoring.present?
      data_monitoring.each do |monitoring|
        array = {
          alat: monitoring.alat.nama_alat,
          suhu: monitoring.suhu,
          kelembaban: monitoring.kelembaban,
          kebisingan: monitoring.kebisingan,
          lux: monitoring.lux,
          debu: monitoring.debu,
          amonia: monitoring.amonia,
        }
        data.push(array)
      end
    end
    render json: data
  end

  # POST /monitorings
  def create
    @monitoring = Monitoring.new(monitoring_params)

    if @monitoring.save
      render json: @monitoring, status: :created, location: @monitoring
    else
      render json: @monitoring.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monitorings/1
  def update
    if @monitoring.update(monitoring_params)
      render json: @monitoring
    else
      render json: @monitoring.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monitorings/1
  def destroy
    @monitoring.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitoring
      @monitoring = Monitoring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monitoring_params
      params.permit(:suhu, :kelembaban, :kebisingan, :lux, :debu, :amonia, :alat_id, :id, :page, :keyword, :limit)
    end
end
