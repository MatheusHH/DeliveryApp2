module Admin::DashboardHelper
  def average_ticket(value)
    average = value / 30
    average = average * 1.00
    average = average / 100
    average = number_to_currency(average, precision: 2, unit: "", separator: ",", delimiter: ".", format: "%n %u")
    average 
  end

  def total_deliveries_fechado(total_deliveries)
    deliveries_fechado = Delivery.entregue.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).count
    fechado_average = total_deliveries > 0 ? (deliveries_fechado.to_f/ total_deliveries) * 100 : 0
    fechado_average.to_f 
  end

  def total_deliveries_enviando(total_deliveries)
    deliveries_enviando = Delivery.enviando.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).count
    enviando_average = total_deliveries > 0 ? (deliveries_enviando.to_f / total_deliveries) * 100 : 0
    enviando_average.to_f  
  end

  def total_deliveries_pendente(total_deliveries)
    deliveries_pendente = Delivery.pendente.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).count   
    pendente_average = total_deliveries > 0 ? (deliveries_pendente.to_f / total_deliveries) * 100 : 0
    pendente_average.to_f 
  end

end
