class User < ApplicationRecord
  acts_as_paranoid
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :lyrics, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  accepts_nested_attributes_for :albums

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50}

  enum gender: [:male, :female]

  ATTRIBUTES_PARAMS = [:name, :gender, :date_of_birth, :email,
    :password, :password_confirmation]

  scope :all_customer, ->{where is_admin: false}
end
