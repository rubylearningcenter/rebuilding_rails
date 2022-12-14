# frozen_string_literal: true

require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'
require 'rulers/file_model'

# “http://host.com/category/action”

module Rulers
  class Application
    HTML_CONTENT_TYPE = { 'Content-Type' => 'text/html' }
    NOT_FOUND_FILES = %w[/ /favicon.ico]

    FAVICON = '/favicon.ico'
    ROOT = '/'

    PAGE_NOT_FOUND = [404, HTML_CONTENT_TYPE, ['Page not found']]
    EMPTY_NOT_FOUND = [404, HTML_CONTENT_TYPE, []]
    GENERIC_SERVER_ERROR = [500, HTML_CONTENT_TYPE, ['Internal server error']]

    def call(environment)
      return EMPTY_NOT_FOUND if environment['PATH_INFO'] == FAVICON
      return PAGE_NOT_FOUND if environment['PATH_INFO'] == ROOT

      # my_domain/controller_name/action
      klass, action = get_controller_and_action(environment)

      return GENERIC_SERVER_ERROR if klass.nil?

      controller = klass.new(environment)

      text = begin
        # You probably call render, right?
        controller.send(action)
        controller.render(action) unless controller.rendered?
      rescue StandardError => e
        binding.irb
        puts e
        'Oops!'
      end

      [
        200, # OK
        HTML_CONTENT_TYPE,
        [text]
      ]
    end
  end
end
