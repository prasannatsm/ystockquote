/***************************************************************************
 *
 * ystockquote.vala : Yahoo Stock API in Vala
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

public class ystockquote : Object {
	// Symbol to look up.
	public string symbol { get; set; }
	
	private string url { private get; private set; }
	
	public double price { get; private set; default = 0; }
	public double change { get; private set; default = 0; }
	public double volume { get; private set; default = 0; }
	public double avg_daily_volume { get; private set; default = 0; }
	public string stock_exchange { get; private set; default = "N/A"; }
	public double market_cap { get; private set; default = 0; } // B for billion
	public double book_value { get; private set; default = 0; }

	// Earnings Before Interest, Taxes, Depreciation, and Amortization.
	public double ebitda { get; private set; default = 0; }
	public double dividend_per_share { get; private set; default = 0; }
	public double dividend_yield { get; private set; default = 0; }
	public double earnings_per_share { get; private set; default = 0; }
	public double 52_week_high { get; private set; default = 0; }
	public double 52_week_low { get; private set; default = 0; }
	public double 50day_moving_avg { get; private set; default = 0; }
	public double 200day_moving_avg { get; private set; default = 0; }
	public double price_earnings_ratio { get; private set; default = 0; }
	public double price_earnings_growth_ratio { get; private set; default = 0; }
	public double price_sales_ratio { get; private set; default = 0; }
	public double price_book_ratio { get; private set; default = 0; }
	public double short_ratio { get; private set; default = 0; }
	
	// Refresh the stock data. Can be called periodically.
	// This method must be called initially to get the Stock Quote.
	public bool refresh_data() {
		bool ret_status = false;
		
		var session = new Soup.SessionAsync ();
		var message = new Soup.Message ("GET", url);
		
		// TODO: Make this call async
		uint response = session.send_message (message);
		if(response == 200) {
			ret_status = true;
			var result = (string) message.response_body.data;
			var data = result.split(",");
			
			/* foreach(var val in data) {
				stdout.printf("%s\n", val);
			} */
			price = double.parse(data[0]);
			change = double.parse(data[1]);
			volume = double.parse(data[2]);
			avg_daily_volume = double.parse(data[3]);
			stock_exchange = data[4];
			market_cap = double.parse(data[5]);
			book_value = double.parse(data[6]);
			ebitda = double.parse(data[7]);
			dividend_per_share = double.parse(data[8]);
			dividend_yield = double.parse(data[9]);
			earnings_per_share = double.parse(data[10]);
			52_week_high = double.parse(data[11]);
			52_week_low = double.parse(data[12]);
			50day_moving_avg = double.parse(data[13]);
			200day_moving_avg = double.parse(data[14]);
			price_earnings_ratio = double.parse(data[15]);
			price_earnings_growth_ratio = double.parse(data[16]);
			price_sales_ratio = double.parse(data[17]);
			price_book_ratio = double.parse(data[18]);
			short_ratio = double.parse(data[19]);
		} else {
			ret_status = false;
			stdout.printf("HTTP Response is %u\n", response);
		}

		return(ret_status);
	}
	
	// A State variable to track if data is already available or not.
	// private bool value_available;
	
	public ystockquote(string symbol) {
		this.symbol = symbol;
		url = @"http://finance.yahoo.com/d/quotes.csv?s=$symbol&f=l1c1va2xj1b4j4dyekjm3m4rr5p5p6s7";
	}
	
	// TODO: Add API to get Historical Data.
}
