class User < ActiveRecord::Base
  before_create { generate_token(:auth_token) }

  has_many :questions, foreign_key: :creator_id
  has_many :assessments, foreign_key: :creator_id

  has_secure_password

  validates_format_of :email, 
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 6
  validates_confirmation_of :password

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
