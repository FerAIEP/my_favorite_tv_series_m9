class CreateFilmLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :film_locations do |t|
      t.string :name
      t.boolean :indoor
      t.references :tv_show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
