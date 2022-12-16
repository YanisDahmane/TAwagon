class AddGameIdToParty < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :game_id, :integer
  end
end
