class CreatePersonas < ActiveRecord::Migration[8.0]
  def change
    create_table :personas do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :money

      t.timestamps
    end
  end
end
