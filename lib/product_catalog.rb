require_relative 'product'

class ProductCatalog
  def initialize(products = [])
    @products = products.each_with_object({}) { |product, hash| hash[product.code] = product }
  end

  def find(product_code)
    @products[product_code] || raise("Product not found: #{product_code}")
  end

  def self.default
    new([
      Product.new('R01', 'Red Widget', 32.95),
      Product.new('G01', 'Green Widget', 24.95),
      Product.new('B01', 'Blue Widget', 7.95)
    ])
  end
end
