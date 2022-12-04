###############################################################################
#   Generates body, extension and options for demo API Calls
###############################################################################
module DemoApiParams
  extend ActiveSupport::Concern

  def demo_body
    case @dotcom.name
      when 'binance'
        {}

      when 'cexio'
        body = {"nonce": @request.nonce, "key":  @api.show_key, "signature": @request.signature}
        case @call.name
          when 'active_orders_status'
            list = {:orders_list=>["8550492", "8550495"]}
            body.merge! list
          when 'balance', 'get_myfee', 'open_orders', 'cancel_orders'
            body
          when 'cancel_order', 'get_order', 'get_order_tx'
            order = {"id": 89067468}
            body.merge! order
          when 'convert'
            {"amnt": "2.5"}
          when 'get_address', 'get_crypto_address'
            currency = {"currency": "BTC"}
            body.merge! currency
          when 'place_order'
            details = {"type": "buy", "amount": 12, "price": 16562.8}
            body.merge! details
          when 'price_stats'
            details = {"lastHours": 24, "maxRespArrSize": 100}
          when 'cancel_replace_order'
            details = {"order_id": 89067468, "type": "buy"}
            body.merge! details

          else
            {}
        end
      else
        {}
    end
  end

  def demo_extension 
    case @dotcom.name
      when 'binance'
        case @call.name
          when 'ticker'
            '/24hr'
          else
            nil
        end

    when 'cexio'
      case @call.name
        when 'convert', 'cancel_orders'
          '/BTC/USD'
        when 'last_price', 'order_book', 'price_stats', 'trade_history'
          '/BTC/USD'
        when 'last_prices'
          '/EUR'
        when 'ohlcv'
          yesterday = (Time.now() - 1.day).strftime("%Y%m%d")
          "/hd/#{yesterday}/BTC/USD"
        when 'balance', 'cancel_order', 'get_address', 'get_order', 'get_order_tx', 'open_orders'
          "/"
        when 'place_order', 'cancel_replace_order'
          '/BTC/USD'
        else
          nil
      end
    else
      nil
    end
  end

  def demo_options
    case @dotcom.name
      when 'binance'
          case @call.name
            when "avgPrice", "ticker", "exchangeInfo",
            {symbol: 'BTCUSDT'}
            when "depth"
              {symbol: 'BTCUSDT', limit: 10}
            when 'historicalTrades', 'trades', "aggTrades"
              {symbol: 'BTCUSDT', limit: 10}
            when 'klines'
              {symbol: 'BTCUSDT', interval: "5m", limit: 10}
            when 'ticker/price', 'ticker/bookTicker'
              {symbols: '["BTCUSDT","BNBUSDT"]'}
            else
              {}
          end

      when 'cexio'
        case @call.name
          when 'balance'
            {}
          when 'convert'
            {}
          when 'active_orders_status'
            {}
          when 'cancel_order'
            {}
          else
            {}
        end
  
      else
        {} 
    end   
  end
end