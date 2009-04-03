class PersonaTeamRoster < ActiveRecord::Base
  belongs_to :persona_team
  belongs_to :persona
end
