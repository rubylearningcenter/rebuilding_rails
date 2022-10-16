# rulers/lib/rulers/util.rb
module Rulers
  def self.to_underscore(string, debug: false)
    # Net::HTTP -> require 'net/http'
    string
      .gsub(/::/, '/')
      .tap { |v| puts "After `.gsub(/::/, '/')`: #{v}" if debug }
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .tap { |v| puts "After `.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')`: #{v}" if debug }
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tap { |v| puts "After `.gsub(/([a-z\d])([A-Z])/,'\1_\2')`: #{v}" if debug }
      .tr('-', '_')
      .tap { |v| puts "After `.tr('-', '_')`: #{v}" if debug }
      .downcase
      .tap { |v| puts "After `.downcase`: #{v}" if debug }
  end
end
