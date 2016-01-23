class User < ActiveRecord::Base
  has_secure_password

  validates_format_of :email, 
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 6
end
