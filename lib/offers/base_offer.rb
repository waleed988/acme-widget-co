module Offers
  class BaseOffer
    def apply(items)
      raise NotImplementedError, "Subclasses must implement #apply"
    end

    def applicable?(items)
      raise NotImplementedError, "Subclasses must implement #applicable?"
    end
  end
end