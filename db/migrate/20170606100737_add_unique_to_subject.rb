class AddUniqueToSubject < ActiveRecord::Migration[5.0]
  def change
  	add_index :subjects, [:sub_id, :sub_name], unique: true
  end
end
