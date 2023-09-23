require 'mqtt'

class MqttController < ApplicationController
  before_action :connect_to_mqtt, only: [:subscribe_to_topic, :mqtt_off, :lampu]
  def connect_to_mqtt
    @client = MQTT::Client.connect(
      host: '103.189.235.124',
      port: 1883,
      username: 'onlyramdan',
      password: 'Sarimiisi8'
    )
    Rails.logger.info 'Connected'
  end

  def subscribe_to_topic
    topic = params["topic"]
    topic, message = @client.get(topic) # Menunggu hingga ada pesan masuk
    # Di sini Anda dapat memproses pesan sesuai kebutuhan Anda
    if message
      # Jika ada pesan yang diterima, Anda dapat mengonversinya ke JSON jika sesuai
      json_data = JSON.parse(message)
      # Sekarang, Anda dapat menggunakan json_data untuk pemrosesan lebih lanjut
      render json: json_data
    else
      # Tindakan yang akan diambil jika tidak ada pesan yang diterima
      render json: { error: 'No message received' }
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
