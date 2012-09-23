module Spree
  class PrintInvoiceConfiguration < Preferences::Configuration
    preference :print_invoice_logo_path, :string, :default => "store/l_and_m_order.png"
  end
end
