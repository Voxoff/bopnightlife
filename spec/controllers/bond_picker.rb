class BondPicker
  def initialize()
    @stock_prices = parse_csv
  end

  def parse_csv
    stock_prices = CSV.open("blah.csv")
  end

  def get_max_profit
    min_price = @stock_prices[0]
    max_profit = 0

    @stock_prices.each do |current_price|

      # Ensure min_price is the lowest price we've seen so far.
      min_price = [min_price, current_price].min

      # See what our profit would be if we bought at the
      # min price and sold at the current price.
      potential_profit = current_price - min_price

      # Update max_profit if we can do better.
      max_profit = [max_profit, potential_profit].max
    end

    max_profit
  end
end

p BondPicker.new.get_max_profit
