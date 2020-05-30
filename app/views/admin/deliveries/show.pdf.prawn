prawn_document(filename: "delivery.pdf") do |pdf|

  
  pdf.text "Dados do Cliente", :size => 20, :style => :bold, :align => :center
  pdf.move_down 40
	

  pdf.text "Cliente: #{@delivery.order.customer.profile.name}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "CPF: #{}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "CEP: #{@delivery.order.customer.profile.cep}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Rua: #{@delivery.order.customer.profile.street}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Bairro: #{@delivery.order.customer.profile.neighborhood}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Cidade: #{@delivery.order.customer.profile.city}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Estado: #{@delivery.order.customer.profile.state}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Email: #{@delivery.order.customer.email}", :size => 12, :align => :left
  pdf.move_down 40
  

  pdf.text "Itens do Pedido", :size => 15, :style => :bold, :align => :center
  pdf.move_down 20

  header = ["Produto", "Preço", "Qnt", "Total"]
  table_data = []
  table_data << header
  @delivery.order.order_items.map do |item|
    table_data << [item.product.name, item.product.price.to_s, item.quantity, formatted_value(item.total)]
  end
 
  pdf.table(table_data) do |t|
    t.row(0).background_color = 'ffffff'
    t.position = :center
    t.column_widths = [130, 130, 130, 130]
    t.row_colors = ["F0F0F0", "FFFFCC"]
  end
  pdf.move_down 20

  pdf.text "Observações: #{@delivery.details}", :size => 12, :align => :left, :style => :bold
  pdf.move_down 20
  
  pdf.text "Total: #{humanized_money_with_symbol(@delivery.order.subtotal)}", :align => :center, :size => 15
  pdf.move_down 50
  
  pdf.text "-----------------------------------------------------", :align => :center

  pdf.text "Assinatura", :align => :center, :size => 12

  pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page> of <total>", :at => [pdf.bounds.right - 150, 0],
 	:width => 150,
 	:align => :right,
 	:page_filter => :all,
 	:start_count_at => 0

end