class EstadosController < ApplicationController
  require 'csv'
  def index
    @estados = Estado.all
  end

  def show
    @estados = Estado.all
    @estado = Estado.find(params[:id])
  end

  def main
    @e = CSV.read("salidaVhdl.csv")
    @e.shift

    Estado.destroy_all

    @e.each do |row|
      est = Estado.new(estado:row[0], IR:row[1], PC:row[2], MAR:row[3], acumulador:row[4])

      case est.estado
      when 0
        est.decode = "Reset"
        est.e_IR = false
        est.e_PC = true
        est.e_MAR = true
        est.e_acumulador = true
        est.e_decode = false
        est.e_alu = false
      when 1
        est.decode = "Fetch"
        est.e_IR = true
        est.e_PC = true
        est.e_MAR = false
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = false
      when 2
        est.decode = "Decode"
        est.e_IR = false
        est.e_PC = false
        est.e_MAR = true
        est.e_acumulador = false
        est.e_decode = true
        est.e_alu = false
      when 3
        est.decode = "Add"
        est.e_IR = false
        est.e_PC = false
        est.e_MAR = true
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = true
      when 4
        est.decode = "Store"
        est.e_IR = false
        est.e_PC = false
        est.e_MAR = true
        est.e_acumulador = true
        est.e_decode = false
        est.e_alu = false
      when 5
        est.decode = "Load"
        est.e_IR = false
        est.e_PC = true
        est.e_MAR = true
        est.e_acumulador = true
        est.e_decode = false
        est.e_alu = false
      when 6
        est.decode = "Jmp"
        est.e_IR = false
        est.e_PC = true
        est.e_MAR = true
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = false
      when 7
        est.decode = "Sub"
        est.e_IR = false
        est.e_PC = false
        est.e_MAR = true
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = true
      when 8
        est.decode = "And"
        est.e_IR = false
        est.e_PC = false
        est.e_MAR = true
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = true
      when 9
        est.decode = "Nop"
        est.e_IR = false
        est.e_PC = false
        est.e_MAR = false
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = false
      when 10
        est.decode = "Jz"
        est.e_IR = false
        est.e_PC = true
        est.e_MAR = true
        est.e_acumulador = false
        est.e_decode = false
        est.e_alu = false
      end

      est.save

    end

  end

end
