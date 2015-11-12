class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.integer :estado
      t.string :IR
      t.string :PC
      t.string :MAR
      t.string :acumulador

      t.timestamps null: false
    end
  end
end
