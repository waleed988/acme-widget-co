require 'minitest/autorun'
require_relative '../lib/product'
require_relative '../lib/product_catalog'
require_relative '../lib/delivery_calculator'
require_relative '../lib/offers/base_offer'
require_relative '../lib/offers/red_widget_bogo_offer'
require_relative '../lib/offer_calculator'
require_relative '../lib/basket'

class BasketTest < Minitest::Test
  def setup
    @basket = Basket.new
  end

  def test_empty_basket_total_is_zero
    assert_equal 0.0, @basket.total
  end

  def test_single_blue_widget_with_delivery
    @basket.add('B01')
    assert_equal 12.90, @basket.total
  end

  def test_example_case_1_b01_g01
    @basket.add('B01')
    @basket.add('G01')
    assert_equal 37.85, @basket.total
  end

  def test_example_case_2_r01_r01
    @basket.add('R01')
    @basket.add('R01')
    assert_equal 54.38, @basket.total.round(2)
  end

  def test_example_case_3_r01_g01
    @basket.add('R01')
    @basket.add('G01')
    assert_equal 60.85, @basket.total
  end

  def test_example_case_4_b01_b01_r01_r01_r01
    @basket.add('B01')
    @basket.add('B01')
    @basket.add('R01')
    @basket.add('R01')
    @basket.add('R01')
    assert_equal 98.28, @basket.total.round(2)
  end

  def test_red_widget_offer_with_three_red_widgets
    3.times { @basket.add('R01') }
    expected = (3 * 32.95) - (32.95 / 2) + 2.95
    assert_equal expected.round(2), @basket.total.round(2)
  end

  def test_delivery_tiers
    basket1 = Basket.new
    basket1.add('B01')
    assert_equal 12.9, basket1.total

    basket2 = Basket.new
    basket2.add('R01')
    basket2.add('G01')
    assert_equal 60.85, basket2.total

    basket3 = Basket.new
    4.times { basket3.add('G01') }
    assert_equal 99.80, basket3.total
  end
end
