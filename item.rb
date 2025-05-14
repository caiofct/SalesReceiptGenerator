class Item
  attr_reader :quantity, :name, :price, :category, :is_imported

  def initialize(quantity:, name:, price:, category: nil, is_imported: false)
    @quantity = quantity
    @name = name
    @price = price
    @category = category || determine_category(name)
    @is_imported = name.include?('imported') || is_imported
  end

  def total_price
    quantity * (price + tax_amount)
  end

  def tax_amount
    TaxCalculator.calculate_tax(price, is_imported, category)
  end

  def total_tax
    tax_amount * quantity
  end

  private

  def determine_category(name)
    case name.downcase
    when /book/
      'book'
    when /chocolate/, /chocolates/
      'food'
    when /pills/
      'medical'
    else
      'other'
    end
  end
end
