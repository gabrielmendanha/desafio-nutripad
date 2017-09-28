require_relative '../constants/words.rb'

# Esta classe converte números para
# o seu respectivo nome por extenso em inglês.
# Recebe como parâmetro um número inteiro e retorna uma string.
# Suporta até a casa dos quadrilhões.
class NumbersToWords
  def in_words(number)

    result = ''

    if number < 0
      result += NEGATIVE + ' '
      number = number.abs #remove o caractere '-' (menos).
    end

    if number.zero?
      result += ZERO
    else

      index = 0
      flag = false
      aux = []

      # Neste loop, o número é repetidamente divido
      # por 1000 para sempre obter o quociente e o resto (modulus).
      # Vai formando a frase de trás para frente, analisando
      # as casas com base no resultado do divmod.
      # Ex: mil. Na primeira iteração teremos como resultado do divmod [1,0].
      # Na segunda iteracão, temos index = 1 e [0,1] como resultado do divmod, logo
      # NAMES[1] = 'thousand' e LESS_ONE_THOUSAND[1] = 'one'. Já obtemos nosso resultado.

      until number.zero?
        number, modulus = number.divmod(1000) # Retorna o quociente e o resto da divisão por mil.

        unless modulus.zero? or index.zero? # Entra caso o resto ou o index não é zero.
          aux << NAMES[index] + ( if !aux.empty? then flag ? ' ' + AND : COMMA else '' end )
        end

        flag = true if index.zero? && modulus < 100 # Muda o status da flag se o índice é zero e o resto é menor que 100

        aux << LESS_ONE_THOUSAND[modulus] unless modulus.zero? # Entra caso o resto não é zero
        index = index.next
      end
      result += aux.reverse.join(' ')
      result.gsub(/ +/, ' ')
    end
  end
end