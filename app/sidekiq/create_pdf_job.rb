class CreatePdfJob
  include Sidekiq::Job

  def perform(booking_id)
    @booking = Booking.find(booking_id)
    invoice_name = "#{Time.now.strftime('%Y%m')}_#{@booking.id}.pdf"
    file_path = Rails.root.join('public', 'invoices', invoice_name)
    
    InvoicePdf.generate(file_path) do |pdf|
      pdf.generate_invoice(@booking)
    end
  end
end
