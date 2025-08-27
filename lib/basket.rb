require_relative 'product_catalog'
require_relative 'delivery_calculator'
require_relative 'offer_calculator'
require_relative 'offer_calculator'


class Basket
  def initialize(catalog = ProductCatalog.default, 
                 delivery_calculator = DeliveryCalculator.new, 
                 offer_calculator = OfferCalculator.default)
    @catalog = catalog
    @delivery_calculator = delivery_calculator
    @offer_calculator = offer_calculator
    @items = []
  end

  def add(product_code)
    product = @catalog.find(product_code)
    @items << product
  end

  def total
    return 0.0 if @items.empty?

    subtotal = calculate_subtotal
    discount = @offer_calculator.calculate_discount(@items)
    subtotal_after_discount = subtotal - discount
    delivery = @delivery_calculator.calculate(subtotal_after_discount)
    
    subtotal_after_discount + delivery
  end

  def items
    @items.dup
  end

  private

  def calculate_subtotal
    @items.sum(&:price)&.round(2)
  end
end