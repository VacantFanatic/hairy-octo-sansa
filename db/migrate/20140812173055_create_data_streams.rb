class CreateDataStreams < ActiveRecord::Migration
  def change
    create_table :data_streams do |t|
      t.string :name
      t.string :csdl
      t.boolean :active

      t.timestamps
    end
  end
end
