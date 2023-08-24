class Modul
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nama, type: String
  field :url, type: String
  field :status, type: String
end
