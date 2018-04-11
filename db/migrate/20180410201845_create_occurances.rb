class CreateOccurances < ActiveRecord::Migration[5.1]
  def change
    create_table :occurances do |t|
      t.integer :at
      t.integer :severity
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
