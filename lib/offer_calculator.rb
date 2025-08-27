require_relative './offers/red_widget_bogo_offer'

class OfferCalculator
  def initialize(offers = [])
    @offers = offers
  end

  def calculate_discount(items)
    @offers.sum { |offer| offer.apply(items) }
  end

  def self.default
    new([Offers::RedWidgetBogoOffer.new])
  end
end
