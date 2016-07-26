class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :team, index: true, foreign_key: true
      t.string :slack_uid

      t.timestamps null: false
    end

    add_index :users, :slack_uid, unique: true
  end
end
