class UpdatePersonaFieldNamesAgain < ActiveRecord::Migration
  def self.up
    rename_column "personas", "industry_name_id", "industry_id"
    rename_column "personas", "job_type_name_id", "job_type_id"
    end

  def self.down
    rename_column "personas", "industry_id", "industry_name_id"
    rename_column "personas", "job_type_id", "job_type_name_id"
  end
end
