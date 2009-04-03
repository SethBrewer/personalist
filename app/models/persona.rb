class Persona < ActiveRecord::Base
  validates_presence_of :first_name, :last_name => "Sorry, it looks like you may have missed some fields"
  belongs_to :myers_briggs_type
  belongs_to :industry_type
  belongs_to :job_type
  belongs_to :photo
	has_many :persona_team_rosters, :dependent => :destroy
  has_many :persona_teams, :through => :persona_team_rosters

  def formatted_name(format)
    case format
    when :first_and_last
      [first_name, middle_name.first + ".", last_name].compact.join(" ")
    when :last_and_first
      [last_name + ",", first_name, middle_name.first + "."].compact.join(" ")
    end
  end

end
