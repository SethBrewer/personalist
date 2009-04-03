class UpdatePersonasColumnNames < ActiveRecord::Migration
  def self.up
    rename_column "personas", "myers_briggs", "myers_briggs_id"
    rename_column "personas", "photo", "photo_id"
    rename_column "personas", "industry_name", "industry_name_id"
    rename_column "personas", "job_type_name", "job_type_name_id"
    end

  def self.down
    rename_column "personas", "myers_briggs_id", "myers_briggs"
    rename_column "personas", "photo_id", "photo"
    rename_column "personas", "industry_name_id", "industry_name"
    rename_column "personas", "job_type_name_id", "job_type_name"
  end
end

    
    
    
    
