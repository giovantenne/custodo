class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :played_on
      t.integer :white_goals, default: 0
      t.integer :black_goals, default: 0

      t.timestamps null: false
    end
  end
end
