class AddNationalityReferenceToTvShows < ActiveRecord::Migration[6.1]
  def change
    add_reference :tv_shows, :nationality, null: false, foreign_key: true
  end
end
