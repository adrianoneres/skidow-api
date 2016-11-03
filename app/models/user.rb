require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_one :account

  validates :name, presence: true
  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true

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
end
