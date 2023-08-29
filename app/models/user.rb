class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :password, type: String
  field :nama, type: String
  field :status, type: String
  
  belongs_to :user_role, class_name: 'UserRole', foreign_key: 'user_role_id'
end
