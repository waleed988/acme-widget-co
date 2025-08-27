require_relative 'base_offer'

module Offers
  class RedWidgetBogoOffer < BaseOffer
    RED_WIDGET_CODE = 'R01'.freeze

    def apply(items)
      red_widgets = items.select { |item| item.code == RED_WIDGET_CODE }
      return 0 if red_widgets.count < 2

      pairs = red_widgets.count / 2
      discount_per_pair = red_widgets.first.price / 2
      pairs * discount_per_pair
    end

    def applicable?(items)
      items.count { |item| item.code == RED_WIDGET_CODE } >= 2
    end
  end
end
