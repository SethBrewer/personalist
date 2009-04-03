class CreateJobTypes < ActiveRecord::Migration
    def self.up
      create_table :job_types do |t|
        t.string :job_type_name
        t.timestamps
      end
    end

    def self.down
      drop_table :job_types
    end
  end
