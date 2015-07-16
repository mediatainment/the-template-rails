module CurrencyHelper

  def number_to_euro(number)
    number_to_currency(number, :unit => "€ ", precision: 0, :separator => ",", :delimiter => ".")
  end

end