class AddNameColumnToPersonaTeams < ActiveRecord::Migration
  def self.up
    add_column :persona_teams, :persona_name, :string
  end

  def self.down
    remove_column :persona_teams, :persona_name, :string
  end
end
