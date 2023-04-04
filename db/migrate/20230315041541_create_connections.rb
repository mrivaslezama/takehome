class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.string :type
      t.text :tag
      t.string :description
      t.string :origin

      t.timestamps
    end
  end
end
