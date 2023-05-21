class AddNeighborVectorToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :embedding, :vector, limit: 1536
  end
end