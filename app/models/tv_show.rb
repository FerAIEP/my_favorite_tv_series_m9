class TvShow < ApplicationRecord
  has_and_belongs_to_many :actors
  has_many :genre_tv_shows
  has_many :genres, through: :genre_tv_shows
  belongs_to :nationality
  belongs_to :user
  has_many :episodes, dependent: :destroy
  has_many :film_locations, dependent: :destroy, inverse_of: :tv_show
  accepts_nested_attributes_for :film_locations
  has_one_attached :image

  validates :name, presence: true
end
