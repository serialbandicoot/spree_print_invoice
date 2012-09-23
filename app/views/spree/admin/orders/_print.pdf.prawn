require 'prawn/layout'

font "Helvetica"
im = "#{Rails.root.to_s}/public/assets/#{Spree::PrintInvoice::Config[:print_invoice_logo_path]}"

image im , :at => [0,720] #, :scale => 2.0

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

move_down 20

render :partial => "line_items_box"

move_down 8

# Footer
# render :partial => "footer"

move_down 4
font "Helvetica",  :size => 11,  :style => :bold
text "Returns", :align => :left

font "Helvetica",  :size => 10
text "We are sure you will be happy with your order, however if you are not completely satisfied with your purchase you may return your order back to us within 28 days of the date of despatch.", :align => :left
move_down 4
text "If any of your items arrive damage or broken we must be notified of this within 48 hours or receipt so we can arrange a replacement or refund. We are unable to replace or refund any items reported damaged after this time."

font "Helvetica",  :size => 11,  :style => :bold
move_down 4
text "Exchanges"

font "Helvetica",  :size => 10
text "If you would like to exchange your order for an alternative please notify us as soon as possible so we can ensure we have your replacement put by for you to avoid disappointment. Please note exchanges will need to processed within 14 days of despatch"

font "Helvetica",  :size => 11,  :style => :bold
move_down 4
text "For more details on refunds and exchanges please refer to our website: www.lilyandmax.co.uk"

font "Helvetica",  :size => 10
move_down 5
text "If you have any questions about your order please feel welcome to contact us: customerservice@lilyandmax.co.uk"

font "Helvetica", :size => 9
move_down 4
text "Lily and Max Limited", :align => :left
text "42 Kempthorne Lane, Bath, BA2 5DX", :align => :left