# rulers/test/application_test.rb
require_relative 'test_helper'
require 'pry'

class TestApp < Rulers::Application
  # Overwrites the normal way we do routing
  # of getting the controller and action from
  # the route, like `test/index`:
  #   [TestController, 'index']
  def get_controller_and_action(_env)
    # binding.pry
    [TestController, 'index']
  end
end

class TestController < Rulers::Controller
  def index
    'Hello!'
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/test/index'
    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end
end
