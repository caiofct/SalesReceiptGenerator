class TaxCalculator
  BASIC_SALES_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05
  EXEMPT_CATEGORIES = %w[book food medical].freeze

  def self.calculate_tax(price, is_imported, category)
    tax = 0.0

    tax += (price * BASIC_SALES_TAX_RATE) unless EXEMPT_CATEGORIES.include?(category)

    tax += (price * IMPORT_DUTY_RATE) if is_imported

    (tax * 20).ceil / 20.0
  end
end
