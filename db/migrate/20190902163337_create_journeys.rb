class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.string :code, null: false
      t.string :status
      t.string :description
      t.timestamps
    end
  end
end
