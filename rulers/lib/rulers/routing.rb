# frozen_string_literal: true

module Rulers
  class Application
    def get_controller_and_action(environment)
      pp(path: environment['PATH_INFO'])

      # {:path=>"/quotes/a_quote"}

      # http://mysite.com/people/create
      # _, people, create, *
      _, controller, action, after =
        environment['PATH_INFO'].split('/', 4)

      pp(controller:, action:, after:)

      return [] if controller.empty? || action.empty?

      controller = controller.capitalize # People
      controller += 'Controller' # PeopleController

      # The actual controller class associated with PeopleController
      controller_class = begin
        Object.const_get(controller)
      rescue
        nil
      end

      return [] unless controller_class

      [controller_class, action]
    end
  end
end
