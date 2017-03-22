class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :sub_id
      t.string :sub_name
      t.text :sub_des

      t.timestamps
    end
  end
end
