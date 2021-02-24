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

  devise :omniauthable, omniauth_providers: [:github, :keycloakopenid]

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

=begin
  def self.from_facebook(auth)

    where(facebook_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
=end

  def self.from_github(auth)
    puts "===="
    puts auth.inspect
    puts "===="
    where(github_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.preferred_username=
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def self.from_omniauth(auth)
    puts "===="
    puts auth.inspect
    puts "===="
    where(openid_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

end
