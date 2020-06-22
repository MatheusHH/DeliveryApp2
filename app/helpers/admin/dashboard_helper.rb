module Admin::DashboardHelper
  def average_ticket(value)
    average = value / 30
    average = average * 1.00
    average = average / 100
    average = number_to_currency(average, precision: 2, unit: "", separator: ",", delimiter: ".", format: "%n %u")
    average 
  end
end
