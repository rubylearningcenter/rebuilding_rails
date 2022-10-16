$LOAD_PATH << File.join(
  File.dirname(__FILE__), '..', 'app', 'controllers'
)

require 'rulers'
# require 'quotes_controller'

module BestQuotes
  class Application < Rulers::Application
    # def call(_env)
    #   # pp "Called from: #{caller[0]}"

    #   # Rightward assignment
    #   super => [
    #     status_code,
    #     response_type,
    #     [body]
    #   ]

    #   [status_code, response_type, ["#{body} - And from Best Quotes"]]
    # end
  end
end
