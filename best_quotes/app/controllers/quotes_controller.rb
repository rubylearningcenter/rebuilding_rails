require 'json'

class QuotesController < Rulers::Controller
  def a_quote_old
    <<~TEXT
      There is nothing either good or bad but thinking makes it so.

      <pre>
        #{JSON.pretty_generate(environment)}
      </pre>
    TEXT
  end

  def a_quote
    render :a_quote, noun: 'blinking'
  end

  def exception
    raise 'an issue'
  end
end
