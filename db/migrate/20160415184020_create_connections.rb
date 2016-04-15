class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :user, index: true
      t.references :otheruser, index: true

      t.timestamps
    end
  end
end
