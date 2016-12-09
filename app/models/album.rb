class Album < ApplicationRecord
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :songs
  enum album_type: [:album, :favourite]
end
