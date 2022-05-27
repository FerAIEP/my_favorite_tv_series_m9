class CreateTvShows < ActiveRecord::Migration[6.1]
  def change
    create_table :tv_shows do |t|
      t.string :name, null: false
      t.text :summary
      t.datetime :release_date
      t.float :rating, default: 0.0

      t.timestamps
    end
  end
end
