require 'rulers'

module BestQuotes
  class Application < Rulers::Application
    def call(_env)
      pp "Called from: #{caller[0]}"

      super => [status_code, response_type, [body]]

      [status_code, response_type, ["#{body} - And from Best Quotes"]]
    end
  end
end
