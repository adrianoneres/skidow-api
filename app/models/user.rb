require 'bcrypt'
require 'securerandom'

class User < ApplicationRecord
  include BCrypt

  has_one :account
  belongs_to :user, foreign_key: 'sender_id'

  validates :name, presence: true
  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true

  before_create :set_auth_token

  self.include_root_in_json = true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.login(email, password)
    @user = User.find_by_email(email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

  private

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
