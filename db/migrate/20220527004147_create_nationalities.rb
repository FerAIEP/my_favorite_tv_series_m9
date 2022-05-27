class CreateNationalities < ActiveRecord::Migration[6.1]
  def change
    create_table :nationalities do |t|
      t.string :name
      t.text :description
      t.string :flag_img

      t.timestamps
    end
  end
end
