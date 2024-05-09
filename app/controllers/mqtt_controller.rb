require 'mqtt'

class MqttController < ApplicationController
  before_action :connect_to_mqtt, only: [:subscribe_to_topic, :mqtt_off, :lampu, :save_db]
  def connect_to_mqtt
    @client = MQTT::Client.connect(
      host: '103.59.95.173',
      port: 1883,
      username: 'iot',
      password: 'password'
    )
    Rails.logger.info 'Connected'
  end
  
  def subscribe_to_topic
    topic = params["topic"]
    topic, message = @client.get(topic) # Menunggu hingga ada pesan masuk
    # Di sini Anda dapat memproses pesan sesuai kebutuhan Anda
    if message
      # Jika ada pesan yang diterima, Anda dapat mengonversinya ke JSON jika sesuai
      data_alat = JSON.parse(message)
      data = {
        id: topic,
        suhu: data_alat['suhu'],
        kelembapan: data_alat['kelembaban'],
        airQuality: data_alat['air_q'],
        time: Time.now.strftime("%H:%M:%S")
      }
      render json: data
    else
      # Tindakan yang akan diambil jika tidak ada pesan yang diterima
      render json: { error: 'No message received' }
    end
  end

  def save_db
    @alats = Alat.where(status: "1")
    if @alats.present?
      @alats.each do |alat|
        topic = alat._id.to_s
        topic, message = @client.get(topic)
        if message
          data_alat = JSON.parse(message)
          data = {
            alat_id: topic,
            suhu: data_alat['suhu'],
            kelembaban: data_alat['kelembaban'],
            airQuality: data_alat['air_q']
          }
          @monitoring = Monitoring.new(data)
          if @monitoring.save
            render json: @monitoring, status: :created, location: @monitoring
          else
            render json: @monitoring.errors, status: :unprocessable_entity
          end
        else
          render json: { error: 'tidak ada data dengan topic' }
        end
      end
    else 
      data_alat = nil
    end
  end

  def mqtt_off
    @client.disconnect
    Rails.logger.info 'Disconnected'
  end

  def lampu
    @client.publish('inTopic', params['id'])
    render json: { status: 'Message sent' }
  end
end
