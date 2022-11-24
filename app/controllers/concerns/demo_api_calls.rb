###############################################################################
#   Generates extension and options for demo API Calls
###############################################################################
module DemoApiCalls
  extend ActiveSupport::Concern

  def add_extension dotcom_name, call_name
    case dotcom_name
      when 'binance'
        case call_name
          when 'ticker'
            '24hr'
          else
            nil
        end

    when 'cexio'
      case call_name
        when 'convert'
          'BTC/USD'
        when 'last_price', 'order_book', 'trade_history'
          'BTC/USD'
        when 'last_prices'
          'EUR'
        when 'ohlcv'
          yesterday = (Time.now() - 1.day).strftime("%Y%m%d")
          "hd/#{yesterday}/BTC/USD"
        else
          nil
      end
    else
      nil
    end
  end

  def add_options dotcom_name, call_name
    case dotcom_name
      when 'binance'
          case call_name
            when "avgPrice", "ticker", "exchangeInfo"
            {symbol: 'BTCUSDT'}
          when "depth"
            {symbol: 'BTCUSDT', limit: 10}
            when 'trades', "aggTrades"
              {symbol: 'BTCUSDT', limit: 10}
            when 'klines'
              {symbol: 'BTCUSDT', interval: "5m", limit: 10}
            when 'ticker/price', 'ticker/bookTicker'
              {symbols: '["BTCUSDT","BNBUSDT"]'}
            else
              {}
          end

      when 'cexio'
        case call_name
          when 'balance'
            {}
          when 'convert'
            {}
          else
            {}
        end
  
      else
        {} 
    end   
  end
end