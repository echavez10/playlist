class Song < ActiveRecord::Base
  belongs_to :user
  has_many :tracks
  has_many :users, through: :tracks
  validates :title, :artist, :presence => true, :length => { minimum: 2 }
end
