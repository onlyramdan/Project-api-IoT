class AksesModul
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_role_id, type: String
  field :modul_id, type: String
end
