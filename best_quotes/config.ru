# best_quotes/config.ru
# run proc {
#   [200, { 'Content-Type' => 'text/html' }, ['Hello, world 2!']]
# } # responds to `call`

# best_quotes/config.ru
require './config/application'

# `run` takes anything that responds to `call` and uses that method
run BestQuotes::Application.new
