class CreateProcessedLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :processed_logs do |t|
      t.references :log
      t.string :phase
      t.boolean :all_phase_done
      t.text :content

      t.timestamps
    end
  end
end
