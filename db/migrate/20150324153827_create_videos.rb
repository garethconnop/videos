class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :length
      t.string :date
      t.text :description
      t.string :video_id
      t.string :slug

      t.timestamps null: false
    end
  end
end
