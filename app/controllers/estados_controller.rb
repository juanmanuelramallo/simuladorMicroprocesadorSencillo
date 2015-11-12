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
      Estado.create(estado:row[0], IR:row[1], PC:row[2], MAR:row[3], acumulador:row[4])
    end

  end

end
