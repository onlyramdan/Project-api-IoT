class UserRole
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_role, type: String

  has_many :users, class_name: "User"
end