class User < ActiveRecord::Base
  has_secure_password

  has_many :users
  has_many :wishs, through: :users
end