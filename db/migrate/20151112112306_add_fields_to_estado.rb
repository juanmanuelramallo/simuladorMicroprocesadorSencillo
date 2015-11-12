class AddFieldsToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :decode, :string
    add_column :estados, :e_IR, :boolean
    add_column :estados, :e_PC, :boolean
    add_column :estados, :e_MAR, :boolean
    add_column :estados, :e_acumulador, :boolean
    add_column :estados, :e_decode, :boolean
    add_column :estados, :e_alu, :boolean
  end
end
