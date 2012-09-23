require 'prawn/layout'

font "Helvetica"
im = "#{Rails.root.to_s}/public/assets/#{Spree::PrintInvoice::Config[:print_invoice_logo_path]}"

image im , :at => [0,750] #, :scale => 2.0

fill_color "E99323"
if @hide_prices
  text I18n.t(:packaging_slip), :align => :right, :style => :bold, :size => 18
else
  text I18n.t(:customer_invoice), :align => :right, :style => :bold, :size => 18
end
fill_color "000000"

move_down 4

font "Helvetica",  :size => 9,  :style => :bold
text "#{I18n.t(:order_number)} #{@order.number}", :align => :right

move_down 2
font "Helvetica", :size => 9
text "#{@order.completed_at.strftime('%d-%B-%Y')}", :align => :right

render :partial => "address"

move_down 30

render :partial => "line_items_box"

move_down 8

# Footer
# render :partial => "footer"

move_down 4
text "Lily and Max Limited", :align => :left
text "42 Kempthorne Lane, Bath, BA2 5DX", :align => :left
text "Invoice Date: #{Time.now.strftime('%d-%B-%Y')}", :align => :left
text "Telephone:    07900345398"