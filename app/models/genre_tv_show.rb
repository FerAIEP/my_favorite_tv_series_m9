class GenreTvShow < ApplicationRecord
  belongs_to :genre
  belongs_to :tv_show
end
