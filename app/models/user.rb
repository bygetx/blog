class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable,:jwt_authenticatable , jwt_revocation_strategy:self

  validate :validate_username
  has_one_attached :avatar
  attr_writer :login
  def login
    @login || username || email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_limit: [150, 150]).processed
    else
      "/default_profile.jpeg"
    end
  end
end
