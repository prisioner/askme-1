module UsersHelper
  def incline(number, nominative, genitive_singular, genitive_plural)
    return genitive_plural if (number % 100).between?(11, 14)

    modulo = number % 10

    return nominative if modulo == 1
    return genitive_singular if modulo.between?(2, 4)

    genitive_plural
  end
end
