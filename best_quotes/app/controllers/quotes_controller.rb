require 'json'

class QuotesController < Rulers::Controller
  def a_quote
    <<~TEXT
      There is nothing either good or bad but thinking makes it so.

      <pre>
        #{JSON.pretty_generate(environment)}
      </pre>
    TEXT
  end

  def exception
    raise 'an issue'
  end
end
