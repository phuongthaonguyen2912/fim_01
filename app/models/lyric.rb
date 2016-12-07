class Lyric < ApplicationRecord
  belongs_to :user
  belongs_to :song
  
  enum status: [:waitting, :approve, :deny]
  scope :is_approve, -> {where status: "approve"}
  scope :lyric_requests, -> {joins(:user).where("users.is_admin = ?","f")}
end
