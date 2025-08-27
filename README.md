# Acme Widget Co Basket System

## Overview

The Acme Widget Co Basket System is a simple shopping basket application that allows users to add products and calculate the total cost, including discounts and delivery charges.

## Features

- Add products to the basket
- Calculate total cost with discounts and delivery charges
- Support for various offers, such as "Buy One Get One Free"

## Components

- **Basket**: Manages the shopping basket and calculates the total cost.
- **ProductCatalog**: Holds a list of available products.
- **Product**: Represents a product with attributes like code, name, and price.
- **DeliveryCalculator**: Calculates delivery charges based on the subtotal.
- **OfferCalculator**: Applies discounts to the basket based on available offers.
- **Offers**: Contains specific offer implementations.

## Usage

1. Initialize a new basket:
   ```ruby
   basket = Basket.new
   ```

2. Add products to the basket:
   ```ruby
   basket.add('R01') # Add a Red Widget
   basket.add('G01') # Add a Green Widget
   ```

3. Calculate the total cost:
   ```ruby
   total = basket.total
   ```

## Running the Demo

To run the demo, execute the `main.rb` file:
```bash
ruby main.rb
```

## Requirements

- Ruby 3.x or higher

## License

This project is licensed under the MIT License.