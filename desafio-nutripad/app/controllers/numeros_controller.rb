class NumerosController < ApplicationController
  before_action :check_number

  HUMANIZE_MAX = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999

  def show
    numero = params[:id]
    numero = numero.to_i
    puts json: numero.humanize
    render json: { 'frase' => numero.humanize }
  end

  def not_found
    render status: 404
  end

  private
  def numeric?(s)
    true if Integer(s) rescue false
  end

  def check_number
    numero = params[:id]
    render status: 400 if !numeric?(numero) || (Integer(numero) > HUMANIZE_MAX)
  end
end
