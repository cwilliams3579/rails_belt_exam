class Song < ApplicationRecord
  belongs_to :user
	validates :artist, :title, presence: true
	validates_length_of :artist, :title, :minimum => 2
end
