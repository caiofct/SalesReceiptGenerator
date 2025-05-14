require_relative 'item'
require_relative 'tax_calculator'
require_relative 'receipt'

input1 = <<~INPUT.chomp
  2 book at 12.49
  1 music CD at 14.99
  1 chocolate bar at 0.85
INPUT

input2 = <<~INPUT.chomp
  1 imported box of chocolates at 10.00
  1 imported bottle of perfume at 47.50
INPUT

input3 = <<~INPUT.chomp
  1 imported bottle of perfume at 27.99
  1 bottle of perfume at 18.99
  1 packet of headache pills at 9.75
  3 imported boxes of chocolates at 11.25
INPUT

receipt = Receipt.new
receipt.add_items_from_input(input1)
puts receipt.print
puts "\n"

receipt = Receipt.new
receipt.add_items_from_input(input2)
puts receipt.print
puts "\n"

receipt = Receipt.new
receipt.add_items_from_input(input3)
puts receipt.print
puts "\n"
