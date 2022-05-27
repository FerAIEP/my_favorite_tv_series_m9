class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.integer :episode_number
      t.string :title
      t.text :summary
      t.references :tv_show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
