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

  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def my_view
    # Good luck!
  end

  def from_me
    quotes = FileModel.where(attribution: "Me")
    render :index, quotes: quotes
  end

  def new_quote
    model = FileModel.create({
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    })

    puts(model:)

    render :quote, obj: model
  end

  def quote_1
    puts "In Controller"
    quote_1 = FileModel.find(1)
    puts(quote_1:)
    render :quote, obj: quote_1
  end

  def a_quote
    render :a_quote, noun: 'blinking'
  end

  def exception
    raise 'an issue'
  end
end
