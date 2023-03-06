def stock_picker(stock_prices)
    buy_days_order = stock_prices.sort
    sell_days_order = stock_prices.sort
    best_days = Array.new(2)
    highest_revenue = 0;
    for buy_day in buy_days_order do
        for sell_day in sell_days_order do
            if(buy_day >= sell_day || stock_prices.index(sell_day) < stock_prices.index(buy_day) || sell_day - buy_day < highest_revenue)
                next
            else
                highest_revenue = sell_day - buy_day
                best_days[0] = stock_prices.index(buy_day)
                best_days[1] = stock_prices.index(sell_day)
            end
        end
    end
    best_days
end 