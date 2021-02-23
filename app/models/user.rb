class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  #
  # validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
  attr_accessor :login

  validates :username, presence: true, uniqueness: {case_sensitive: false}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable


  def self.find_first_by_auth_conditions(warden_conditions)
=begin
    puts "===="
    puts warden_conditions.inspect
    puts "===="
=end
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = ? OR lower(email) = ?", login.downcase, login.downcase).first
    else
      where(conditions.to_hash).first
    end
  end
end
