class User < ActiveRecord::Base
  has_secure_password
  has_many :books

  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }
end
