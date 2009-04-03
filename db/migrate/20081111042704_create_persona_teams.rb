class CreatePersonaTeams < ActiveRecord::Migration
    def self.up
      create_table :persona_teams do |t|
        t.integer :persona_id
        t.integer :account_id
        t.timestamps
      end
    end

    def self.down
      drop_table :persona_teams
    end
  end
