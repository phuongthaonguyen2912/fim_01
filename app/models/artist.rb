class Artist < ApplicationRecord
  acts_as_paranoid

  has_many :artist_songs
  has_many :songs, through: :artist_songs

  validates :name, presence: true, length: {minimum: 6}
  validates :gender, presence: true
  validates :type_of_music, presence: true
  validates :artist_type, presence: true

  enum gender: [:male, :female, :other]
  enum artist_type: [:singer, :composer]
  enum type_of_music: [:pop, :jazz, :rock, :balad, :rap, :another]
end
