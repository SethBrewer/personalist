class CreateIndustryTypes < ActiveRecord::Migration
    def self.up
      create_table :industry_types do |t|
        t.string :industry_type_name
        t.timestamps
      end
    end

    def self.down
      drop_table :industries
    end
  end
