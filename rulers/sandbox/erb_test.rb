# sandbox/erb_test.rb
require 'erubis'

template = <<~TEMPLATE
  Hello! This is a template.
  It has <%= whatever %> and <%= our_thing %>.
TEMPLATE

eruby = Erubis::Eruby.new(template)

puts eruby.src
puts '=========='
puts eruby.result(
  whatever: 'ponies',
  our_thing: 'foxes'
)
