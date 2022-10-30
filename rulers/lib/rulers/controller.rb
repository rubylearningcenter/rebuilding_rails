require 'erubis'
require "rulers/file_model"

module Rulers
  class Controller
    include Rulers::Model

    attr_reader :environment
    attr_reader :called_render_explicitly

    def initialize(environment)
      @environment = environment
      @called_render_explicitly = false
    end

    def rendered?
      @called_render_explicitly
    end

    def render(view_name, locals = {})
      @called_render_explicitly = true

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
