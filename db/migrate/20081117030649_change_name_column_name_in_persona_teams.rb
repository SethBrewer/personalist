class ChangeNameColumnNameInPersonaTeams < ActiveRecord::Migration
  def self.up
    rename_column "persona_teams", "persona_name", "persona_team_name"
  end

  def self.down
    rename_column "persona_teams", "persona_team_name", "persona_name"
  end
end
