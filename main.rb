require_relative './lib/basket'

puts "=== Acme Widget Co Basket System Demo ==="
puts

puts "1. Basic Usage Example:"
basket = Basket.new
basket.add('R01')
basket.add('G01')
puts "   Added R01 (Red Widget) + G01 (Green Widget)"
puts "   Total: $#{'%.2f' % basket.total}"
puts

puts "2. BOGO Offer Demonstration:"
basket2 = Basket.new
basket2.add('R01')
puts "   Added first R01: $#{'%.2f' % basket2.total}"
basket2.add('R01')
puts "   Added second R01 (half price): $#{'%.2f' % basket2.total}"
puts "   Discount applied: $#{'%.2f' % (2 * 32.95 + 4.95 - basket2.total)}"
puts

puts "3. Delivery Tier Examples:"
baskets = [
  { items: %w[B01], description: "Under $50 order" },
  { items: %w[R01 G01], description: "$50-89 order" },
  { items: %w[R01 R01 G01], description: "$90+ order (free delivery)" }
]

baskets.each do |example|
  basket = Basket.new
  example[:items].each { |code| basket.add(code) }
  puts "   #{example[:description]}: #{example[:items].join(', ')} = $#{'%.2f' % basket.total}"
end
puts

puts "4. Custom Configuration Example:"
catalog = ProductCatalog.new([
  Product.new('R01', 'Red Widget', 32.95),
  Product.new('G01', 'Yellow Widget', 24.95),
  Product.new('B01', 'Blue Widget', 7.95)
])
delivery = DeliveryCalculator.new

custom_basket = Basket.new(catalog, delivery)
custom_basket.add('R01')
custom_basket.add('R01')
puts "   Same items with NO offers: $#{'%.2f' % custom_basket.total}"
puts "   (Compare to BOGO version: $#{'%.2f' % basket2.total})"
puts

puts "=== Demo Complete ==="