class CreateExternalRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :external_ratings do |t|
      t.integer :movie_id
      t.string :source_name
      t.float :rating

      t.timestamps
    end
  end
end
