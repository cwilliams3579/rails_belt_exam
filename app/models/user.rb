class User < ApplicationRecord
  has_secure_password
	has_many :songs
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :password, :confirmation => true
	validates :terms, acceptance: true
	validates_length_of :password, :in => 6..20, :on => :create
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	before_save do
		self.email.downcase!
	end
end
