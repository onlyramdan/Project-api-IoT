class Alat
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nama_alat, type: String
  field :lokasi, type: String
  field :status, type: String
end
