class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :age
      t.string :gender
      t.string :ethnicity
      t.integer :myers_briggs_type_id
      t.string :photo
      t.integer :industry_type_id
      t.integer :job_type_id
      t.text :job_description
      t.text :life_description
      t.string :Status
      t.timestamps
  end
end

  def self.down
    drop_table :personas
  end
end
