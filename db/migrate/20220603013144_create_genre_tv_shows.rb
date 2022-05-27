class CreateGenreTvShows < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_tv_shows do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :tv_show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
