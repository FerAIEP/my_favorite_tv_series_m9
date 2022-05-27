class CreateActorsAndTvShows < ActiveRecord::Migration[6.1]
  def change
    create_table :actors_tv_shows, id: false do |t|
      t.belongs_to :actor
      t.belongs_to :tv_show
    end
  end
end
