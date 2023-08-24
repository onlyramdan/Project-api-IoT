class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :password, type: String
  field :nama, type: String
  field :status, type: String

  has_many :user_role
end
