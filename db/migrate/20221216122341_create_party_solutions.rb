class CreatePartySolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :party_solutions do |t|
      t.integer :party_id
      t.integer :solution_id

      t.timestamps
    end
  end
end
