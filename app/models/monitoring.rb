class Monitoring
  include Mongoid::Document
  include Mongoid::Timestamps
  field :suhu, type: String
  field :kelembaban, type: String
  field :airQuality, type: String

  belongs_to :alat, class_name: 'Alat', foreign_key: 'alat_id'
end
