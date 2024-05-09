require 'mqtt'

namespace :iot_sch do
  desc "Update Monitoring"
  task :save => :environment do
    puts "Updating New Monitoring"
    @client = MQTT::Client.connect(
      host: '103.59.95.173',
      port: 1883,
      username: 'iot',
      password: 'password'
    )
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
            puts "Monitoring berhasil disimpan -- #{Time.now}"
          else
            puts "Gagal menyimpan monitoring"
          end
        else
          puts "Tidak ada data dari alat #{topic}"
        end
      end
    else
      puts "Tidak ada alat aktif"
    end
    @client.disconnect
  end
end
