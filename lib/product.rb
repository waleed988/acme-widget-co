class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  def ==(other)
    other.is_a?(Product) && code == other.code
  end
end