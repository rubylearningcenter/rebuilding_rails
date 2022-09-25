# frozen_string_literal: true

require 'rulers/version'

module Rulers
  class Application
    HTML_CONTENT_TYPE = { 'Content-Type' => 'text/html' }

    def call(_env)
      `echo debug > debug.txt`

      pp "Called from: #{caller[0]}"

      [
        200,
        HTML_CONTENT_TYPE,
        ['Hello from Ruby on Rulers 2!']
      ]
    end
  end
end
