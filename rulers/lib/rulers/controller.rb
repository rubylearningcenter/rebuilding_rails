require 'erubis'

module Rulers
  class Controller
    attr_reader :environment

    def initialize(environment)
      @environment = environment
    end

    def render(view_name, locals = {})
      file_name = File.join(
        'app',
        'views',
        controller_name,
        "#{view_name}.html.erb"
      )

      template = File.read(file_name)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(environment:))
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, '')
      Rulers.to_underscore(klass)
    end
  end
end
