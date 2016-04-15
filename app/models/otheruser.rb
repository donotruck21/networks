class Otheruser < ActiveRecord::Base

	has_many :invitations
	has_many :connections


	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  	validates :o_name, :o_email, :o_description,
  		presence: true

  	validates :o_email,
		uniqueness: { case_sensitive: false }, 
		format: { with: EMAIL_REGEX }

	validates :o_name, :o_description, 
		length: {minimum: 2}
end
