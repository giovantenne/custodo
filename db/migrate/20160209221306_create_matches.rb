class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :played_on
      t.integer :white_goal
      t.integer :black_goal

      t.timestamps null: false
    end
  end
end
