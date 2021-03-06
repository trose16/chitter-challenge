require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password_hash, Text

  @@user_count = 0

  def initialize(params)
    # self.password = params[:password]
    self.email = params[:email]
    self.name = params[:name]
    self.username = params[:username]
    @@user_count += 1
  end


  def self.user_count
    @@user_count
  end

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

end
