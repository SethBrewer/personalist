require 'digest/sha1'

class Account < ActiveRecord::Base
  validates_presence_of :email, :name
  validates_presence_of :password, :unless => :password_is_not_being_updated?
  validates_uniqueness_of :email, :message => "has already created an account."
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_length_of :email, :within => 3..100
  validates_format_of :with => /^([\x20-\x7E]){4,16}$/,
                        :message => "must be 4 to 16 characters",
                        :unless => :password_is_not_being_updated?
  #attr_accessor :password_confirmation #not used
  #validates_confirmation_of :password
  validates_length_of :password, :within => 4..40, 
                        :unless => :password_is_not_being_updated?
  
  before_save :lowercase_email
  after_save :clear_password
  
  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end
  
  'password is a virtual attribute'
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    unless password_is_not_being_updated?
      create_new_salt
      self.hashed_password = Account.encrypted_password(self.password, self.salt)
    end
  end
  
  def update_last_login_at!
    self.last_login_at = Time.now
    self.password = ""
    self.save_with_validation(false)
  end
  
  def self.authenticate(email, password)
    account = self.find_by_email(email)
    if(account)
      expected_password = encrypted_password(password,account.salt)
      logger.debug("hashed: #{account.hashed_password}")
      logger.debug("expected: #{expected_password}")
      if account.hashed_password != expected_password
        account = nil
      end
    end
    account
  end
  
  def self.authenticate_using_token(id, token)
    account = self.find(id)
    return account if account.auth_token == token 
  end
  
  def auth_token
    string_to_hash = "#{self.salt}InsertSomeKeyHere#{self.email}"
    return Digest::SHA1.hexdigest(string_to_hash)
  end
  
  private
  
  def self.encrypted_password(password, salt)
    string_to_hash = "#{password}InsertSomeDifferentKeyHere#{salt}"
    Digest::SHA1.hexdigest(string_to_hash)
  end 
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def lowercase_email
    self.email.downcase!
  end
  
  def clear_password
    @password = nil
  end
  
  def password_is_not_being_updated?
    self.id and self.password.blank?
  end
end
