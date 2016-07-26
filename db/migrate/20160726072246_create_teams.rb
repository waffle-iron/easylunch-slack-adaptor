class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :access_token
      t.string :slack_team_name
      t.string :slack_team_id
      t.string :bot_access_token

      t.timestamps null: false
    end

    add_index :teams, :slack_team_id, unique: true
  end
end
