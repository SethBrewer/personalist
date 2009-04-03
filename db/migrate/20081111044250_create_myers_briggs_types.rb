class CreateMyersBriggsTypes < ActiveRecord::Migration
    def self.up
      create_table :myers_briggs_types do |t|
        t.string :mbti_type_name
        t.string :mbti_type_description
        t.timestamps
      end
    end

    def self.down
      drop_table :myers_briggs_types
    end
  end
