class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :imdb_id
      t.text :overview
      t.jsonb :genres
      t.datetime :release_date
      t.text :tagline
      t.jsonb :raw_data

      t.timestamps
    end
  end
end