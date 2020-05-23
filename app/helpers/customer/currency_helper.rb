module Customer::CurrencyHelper
  def formatted_value(value)
    value = value * 1.00
    value = value / 100
    value = number_to_currency(value, precision: 2, unit: "", separator: ",", delimiter: ".", format: "%n %u")
  end
end