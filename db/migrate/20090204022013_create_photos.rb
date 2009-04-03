class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
        t.column :description, :string
        t.column :content_type, :string
        t.column :filename, :string
        t.column :binary_data, :binary
    end
end

  def self.down
    drop_table :photos
  end
end
