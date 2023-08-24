class UserRole
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_role, type: String
  field :user_id, type: String

  belongs_to :user
end
