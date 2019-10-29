class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.text :description
      t.integer :stress
      t.date :og_date
      t.date :adj_date

      t.timestamps
    end
  end
end
