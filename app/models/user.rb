class User < ActiveRecord::Base

	has_many :invitations
	has_many :connections


  	has_secure_password

  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  	validates :name, :email, :description,
  		presence: true

  	validates :email,
		uniqueness: { case_sensitive: false }, 
		format: { with: EMAIL_REGEX }

	validates :name, :description, 
		length: {minimum: 2}

	validates :password, 
		length: {minimum: 8}, 
		confirmation: true,
		on: :create
end
