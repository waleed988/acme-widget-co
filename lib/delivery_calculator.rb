class DeliveryCalculator
  def initialize(rules = default_rules)
    @rules = rules.sort_by { |rule| rule[:threshold] }.reverse
  end

  def calculate(subtotal)
    applicable_rule = @rules.find { |rule| subtotal >= rule[:threshold] }
    applicable_rule ? applicable_rule[:cost] : 0
  end

  private

  def default_rules
    [
      { threshold: 90.0, cost: 0.0 },
      { threshold: 50.0, cost: 2.95 },
      { threshold: 0.0, cost: 4.95 }
    ]
  end
end