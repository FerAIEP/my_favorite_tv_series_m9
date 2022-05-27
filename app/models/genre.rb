class Genre < ApplicationRecord
  has_many :genre_tv_shows
  has_many :tv_shows, through: :genre_tv_shows
end
