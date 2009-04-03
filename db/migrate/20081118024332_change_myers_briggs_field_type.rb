class ChangeMyersBriggsFieldType < ActiveRecord::Migration
  def self.up
    change_column(:myers_briggs_types, :mbti_type_description, :text)
  end

  def self.down
    change_column(:myers_briggs_types, :mbti_type_description, :string)
  end
end
