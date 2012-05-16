/***************************************************************************
 *
 * ystock_sample.vala : Sample application that uses ystockquote
 *
 * Copyright (C) 2012 Prasanna Kumar T S M, <prasannatsmkumar@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 **************************************************************************/

public void main(string[] args) {
	string symbol = "TAKE.BO";
	
	if(args.length > 1) {
		symbol = args[1];
		stdout.printf("Going to fetch quote for %s\n", symbol);
	}
	ystockquote quote = new ystockquote(symbol);
	bool status = false;
	status = quote.refresh_data();
	
	if(status == true) {
		stdout.printf("Stock = %s\n", quote.symbol);
		stdout.printf("Current Stock Price = %lf\n", quote.price);
		stdout.printf("change = %lf\n", quote.change);
		stdout.printf("volume = %lf\n", quote.volume);
		stdout.printf("avg_daily_volume = %lf\n", quote.avg_daily_volume);
		stdout.printf("stock_exchange = %s\n", quote.stock_exchange);
		stdout.printf("market_cap = %lf\n", quote.market_cap);
		stdout.printf("book_value = %lf\n", quote.book_value);
		stdout.printf("ebitda = %lf\n", quote.ebitda);
		stdout.printf("dividend_per_share = %lf\n", quote.dividend_per_share);
		stdout.printf("dividend_yield = %lf\n", quote.dividend_yield);
		stdout.printf("earnings_per_share = %lf\n", quote.earnings_per_share);
		stdout.printf("52_week_high = %lf\n", quote.52_week_high);
		stdout.printf("52_week_low = %lf\n", quote.52_week_low);
		stdout.printf("50day_moving_avg = %lf\n", quote.50day_moving_avg);
		stdout.printf("200day_moving_avg = %lf\n", quote.200day_moving_avg);
		stdout.printf("price_earnings_ratio = %lf\n", quote.price_earnings_ratio);
		stdout.printf("price_earnings_growth_ratio = %lf\n", quote.price_earnings_growth_ratio);
		stdout.printf("price_sales_ratio = %lf\n", quote.price_sales_ratio);
		stdout.printf("price_book_ratio = %lf\n", quote.price_book_ratio);
		stdout.printf("short_ratio = %lf\n", quote.short_ratio);
	} else {
		stdout.printf("Cannot get quote for %s\n", symbol);
	}
}
