class RemoveColumnPersonaIdFromPersonaTeams < ActiveRecord::Migration
   def self.up
      remove_column :persona_teams, :persona_id
   end

   def self.down
      add_column :persona_teams, :persona_id, :string
   end
end

