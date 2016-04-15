class CreateOtherusers < ActiveRecord::Migration
  def change
    create_table :otherusers do |t|
      t.string :o_name
      t.string :o_email
      t.text :o_description

      t.timestamps
    end
  end
end
