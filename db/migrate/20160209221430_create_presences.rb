class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :player, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true
      t.string :team

      t.timestamps null: false
    end
  end
end
