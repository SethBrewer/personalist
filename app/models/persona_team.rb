class PersonaTeam < ActiveRecord::Base
  belongs_to :account
  has_many :persona_team_rosters, :dependent => :destroy
  has_many :personas, :through => :persona_team_rosters
end