module Request
  #########################################################
  # Shell to provide Net::HTTP for different platforms
  #########################################################
  extend ActiveSupport::Concern
  require 'net/http'

  #########################################################
  # Net::HTTP ZT Class:  
  #   API Request with selected dotcom, API mode & Call 
  #
  #   extension sample:
  #     "hd/20221110/BTC/USD"
  #
  #   options sample:
  #     {
  #       :symbol => "BCHUSDT",
  #       :interval => "1h",
  #       :limit => 50
  #     }
  #########################################################
  class  Request
    def initialize dotcom:, api:, call:, extension: nil, options: {}
      @dotcom    = dotcom
      @api       = api
      @call      = call
      @extension = extension
      @options   = options
    end

    def api
      @api.presence
    end

    def call
      @call.presence
    end

    def dotcom
      @dotcom.presence
    end

    def extension
      @extension.presence
    end

    def options
      @options.presence
    end

    def uri
      url = @api.endpoint + "/" + @call.name + "/"  # Must be ended with '/'
      url << "#{@extension}" unless @extension.nil?
      uri = URI url
      uri.query = URI.encode_www_form(options) unless options.nil?
      uri
    end
  end

  class GetRequest < Request
    def send
      begin
        response = Net::HTTP.get(self.uri)
      rescue StandardError => e
        {error: e}
      else
        begin 
          JSON.parse response     # => Hash
        rescue
          {error: "HTTP.get(#{self.uri}) failed"} 
        end
      end
    end
  end

  class PostRequest < Request
    def send_post body: {}
      # header = {
      #   "Content-Type" => "application/json",
      #   "Accept" => "application/json"
      # }
      begin
        response = Net::HTTP.post_form self.uri, body
        # response = Net::HTTP.post self.uri, body.to_json, header
      rescue StandardError => e
        {error: e}
      else
        begin 
          JSON.parse response.body     # => Hash
        rescue
          {error: "HTTP.post(#{self.uri}) failed"} 
        end
      end
    end

    def signature nonce
      message = nonce + api.user + api.show_key
      OpenSSL::HMAC.hexdigest("SHA256", api.show_secret, message)
    end
  end

  private

    ##############################################################################
    # Checks whether response is an error message aka:
    #   {"success":0, "error":"Invalid method"}
    #   {"error":"Invalid Symbols Pair"}
    #   {"code":-1102,"msg":"Mandatory parameter 'interval' was not sent, was empty/null, or malformed."}
    #
    # If error: returns empty hash, otherwise: returns response
    # 
    # caller_locations(1,1)[0].label - the calling method
    #
    #   06.06.2022
    #   13.11.2022  Modified
    ##############################################################################
    def request_error_check response
      error_msg = nil
      if response.is_a? Hash
        if response['code'].present?
          error_msg = "Code #{response['code']}: #{response['msg']}\n called by: #{caller_locations(1,1)[0].label}"
        elsif response['error'].present?
          error_msg = "Error: #{response['error']}\n called by: #{caller_locations(1,1)[0].label}"
        else
        end 
        error_msg
      else
        error_msg
      end
    end

    # Clones public_api calls to demo_api
    def demo_calls(dotcom)
      Api.find_by( dotcom: dotcom, mode: 'public_api').calls
    end

    # # Selects instances from DDDLs - obsolete? (cause of an extra SELECT)
    # def selected_from_dddl
    #   @dotcom  = Dotcom.find_by(id: params[:dotcom].presence)  # object.present? ? object : nil, 
    #   @api     = Api.find_by(id: params[:api].presence)
    #   @call    = Call.find_by(id: params[:call].presence)
    #   @pair    = Pair.find_by(id: params[:pair].presence)
    #   @slot    = Candlestick.slots[params[:slot].presence] # this is a value (0,1,2...)
    #                                                        # params[:slot] is a key: '1m', '3m',...
    # end

    # def timestamp
    #   Time.now.strftime('%Y-%m-%d %H:%M:%S')
    # end
end