class Receipt
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def add_items_from_input(input)
    input.split("\n").each do |line|
      if line =~ /(\d+) (.*) at (\d+\.\d+)/
        quantity = $1.to_i
        name = $2
        price = $3.to_f
        add_item(Item.new(quantity: quantity, name: name, price: price))
      end
    end
  end

  def total_tax
    @items.sum(&:total_tax)
  end

  def total_amount
    @items.sum(&:total_price)
  end

  def print
    output = []
    @items.each do |item|
      output << "#{item.quantity} #{item.name}: #{format('%.2f', item.total_price)}"
    end
    output << "Sales Taxes: #{format('%.2f', total_tax)}"
    output << "Total: #{format('%.2f', total_amount)}"
    output.join("\n")
  end
end
