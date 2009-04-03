class CreatePersonaTeamRosters < ActiveRecord::Migration
    def self.up
      create_table :persona_team_rosters do |t|
        t.integer :persona_team_id
        t.integer :persona_id
        t.string :job_needs
        t.string :life_needs
        t.string :rank
        t.timestamps
      end
    end

    def self.down
      drop_table :persona_team_rosters
    end
  end
