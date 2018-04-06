class User < ApplicationRecord
  # include ImageUploader[:avatar]
#Relations
  has_many :parkingspots
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login

## Username validations
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  validates :date_of_birth, :presence => true
  validate :validate_age


  private
#Validates the users age making sure they are 18 years or older
  def validate_age
      if date_of_birth.present? && date_of_birth > 18.years.ago.to_date
          errors.add(:date_of_birth,': You should be over 18 years old.')
      end
  end
#Validates the username and email and make sure they won't ever match
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

#Allows the user to log in with either their username or email
  def self.find_for_database_authentication warden_conditions
  	conditions = warden_conditions.dup
  	login = conditions.delete(:login)
  	where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
	end


end
