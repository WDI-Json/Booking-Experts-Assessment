class InvoicePdf < Prawn::Document

  def generate_invoice(booking)
    logopath = 'app/assets/images/bookify-logo.png'
    address_x = 35
    invoice_header_x = 325
    lineheight_y = 12
    font_size = 9
    move_down 5

    amount_due = "€#{'%.2f' % (booking.accommodation.cost_per_night * booking.amount_of_days)}"
    cost_per_night = "€#{'%.2f' % booking.accommodation.cost_per_night}"
    # Add the font style and size
    font "Helvetica"
    font_size font_size

    # Business address
    text_box "Bookify", at: [address_x, cursor]
    move_down lineheight_y
    text_box "Regelandisstraat 17", at: [address_x, cursor]
    move_down lineheight_y
    text_box "Zwolle, 8022BN", at: [address_x, cursor]
    move_down lineheight_y

    last_measured_y = cursor
    move_cursor_to bounds.height

    image logopath, width: 64, position: :right

    move_cursor_to last_measured_y

    # Client address
    move_down 65
    last_measured_y = cursor

    text_box "Invoice for", at: [address_x, cursor]
    move_down lineheight_y
    text_box booking.user.email, at: [address_x, cursor]
    move_down lineheight_y
    #TODO: add extra fields to user
    # text_box "4321 Some Street Suite 1000", at: [address_x, cursor]
    # move_down lineheight_y
    # text_box "Some City, ST 12345", at: [address_x, cursor]

    text_box "At partner", at: [address_x, cursor]
    move_down lineheight_y
    text_box booking.partner.name + " (" + booking.partner.location + ")", at: [address_x, cursor]
    move_down lineheight_y

    move_cursor_to last_measured_y

    # Invoice header
    invoice_header_data = [
      ["Invoice #", "#{booking.created_at.strftime("%Y%m")}%03d" %booking.id],
      ["Invoice Date", booking.created_at.strftime("%Y-%m-%d")],
      # TODO: Find out why number_to_currency does not work and fix it
      ["Amount Due", amount_due ]
    ]

    table(invoice_header_data, position: invoice_header_x, width: 215) do
      cells.padding = [1, 5, 1, 5]
      cells.borders = []
      row(2).background_color = 'e9e9e9'
      row(2).border_color = 'dddddd'
      row(2).font_style = :bold
      column(1).align = :right
      row(2).columns(0).borders = [:top, :left, :bottom]
      row(2).columns(1).borders = [:top, :right, :bottom]
    end

    move_down 45

    # Invoice services
    invoice_services_data = [
      ["Item", "Description", "Unit Cost", "Quantity", "Line Total"],
      ["Accommodation", booking.accommodation.name, cost_per_night, booking.amount_of_days, amount_due],
      ["VOUCHER: CLEAN2024", "Cleaning", "€0.00", "1", "€0.00"]
    ]

    table(invoice_services_data, width: bounds.width) do
      cells.padding = [4, 5, 4, 5]
      row(0).background_color = 'e9e9e9'
      row(0).border_color = 'dddddd'
      row(0).font_style = :bold
      row(0).borders = [:top, :bottom]
      row(0).columns(0).borders = [:top, :left, :bottom]
      row(0).columns(-1).borders = [:top, :right, :bottom]
      row(-1).border_width = 2
      columns(2..-1).align = :right
      columns(0).width = 75
      columns(1).width = 275
    end

    move_down 1

    # Invoice totals
    invoice_services_totals_data = [
      ["Total", amount_due],
      ["Amount Paid", "€0.00"],
      ["Amount Due", amount_due]
    ]

    table(invoice_services_totals_data, position: invoice_header_x, width: 215) do
      cells.padding = [1, 5, 1, 5]
      cells.borders = []
      row(0).font_style = :bold
      row(2).background_color = 'e9e9e9'
      row(2).border_color = 'dddddd'
      row(2).font_style = :bold
      column(1).align = :right
      row(2).columns(0).borders = [:top, :left, :bottom]
      row(2).columns(1).borders = [:top, :right, :bottom]
    end

    move_down 25

    # Terms
    invoice_terms_data = [
      ["Terms"],
      ["All payments are due upon receipt of the invoice."],
      [" "],
      ["Cancellations made less than 7 days before the check-in date are non-refundable."]
    ]

    table(invoice_terms_data, width: 275) do
      cells.padding = [1, 0, 1, 0]
      cells.borders = []
      row(0).font_style = :bold
    end

    move_down 15

    # Notes
    invoice_notes_data = [
      ["Notes"],
      ["Thank you for choosing for Bookify!"]
    ]

    table(invoice_notes_data, width: 275) do
      cells.padding = [1, 0, 1, 0]
      cells.borders = []
      row(0).font_style = :bold
    end
  end
end

