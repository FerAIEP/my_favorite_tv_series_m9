class AddUserReferenceToTvShows < ActiveRecord::Migration[6.1]
  def change
    add_reference :tv_shows, :user, null: false, foreign_key: true
  end
end
