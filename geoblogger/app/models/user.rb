require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :posts
  has_many :events
  has_many :comments

  validates_presence_of :first_name, :last_name, :email_address
  validates_uniqueness_of :email_address
  validates_format_of :first_name, :last_name,
                      :with => /^\w+$/, 
                      :message => "is missing or invalid"
  #validates_format_of :email_address,
  #                    :with => /^([^@s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i
  validates_inclusion_of :gender,
                         :in => %w(male female),
                         :message => "should be 'male' or 'female'"
                         
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  def self.authenticate(email_address, password)
    user = self.find_by_email_address(email_address)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  # 'password' is a virtual attribute
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
private

  def password_non_blank
    erros.add(:password, "Missing password") if hashed_password.blank?
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "geoblogger" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
end
