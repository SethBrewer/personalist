class AddColumnDescriptionToPersonaTeams < ActiveRecord::Migration
  def self.up
    add_column :persona_teams, :persona_team_description, :text
  end

  def self.down
    remove_column :persona_teams, :persona_team_description, :text
  end
end
