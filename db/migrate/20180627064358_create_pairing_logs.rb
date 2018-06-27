class CreatePairingLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairing_logs do |t|
      t.string :name
      t.json :data

      t.timestamps
    end
  end
end
