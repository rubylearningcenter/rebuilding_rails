require 'multi_json'

module Rulers
  module Model
    class FileModel
      def initialize(file_name)
        puts 'In initialize'
        @file_name = file_name

        # If filename is "dir/37.json", @id is 37
        basename = File.split(file_name)[-1]
        @id = File.basename(basename, '.json').to_i

        obj = File.read(file_name)
        @hash = MultiJson.load(obj)
      end

      # {
      #   "submitter": "Jeff",
      #   "quote": "A penny saved is a penny earned.",
      #   "attribution": "Ben Franklin"
      # }

      # array = [1, 2, 3]
      # array[0] # => 1
      # array.[](0)
      def [](name) # "submitter"
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      # keys = nil -> return all keys
      #
      def deconstruct_keys(_keys)
        @hash.transform_keys(&:to_sym)
      end

      class << self
        def find(id)
          file_path = "db/quotes/#{id}.json"

          return nil unless File.exist?(file_path)

          FileModel.new(file_path)
        rescue StandardError
          nil
        end

        def all
          files = Dir['db/quotes/*.json']
          files.map { |f| FileModel.new(f) }
        end

        def create(attrs)
          hash = {
            'submitter' => attrs.fetch('submitter', ''),
            'quote' => attrs.fetch('quote', ''),
            'attribution' => attrs.fetch('attribution', '')
          }

          files = Dir['db/quotes/*.json']
          names = files.map { |f| File.split(f).last }
          highest = names.map(&:to_i).max
          id = highest + 1

          File.open("db/quotes/#{id}.json", 'w') do |f|
            f.write JSON.pretty_generate(hash)
          end

          FileModel.new("db/quotes/#{id}.json")
        end

        def where(**query_params)
          string_query_params = query_params.transform_keys(&:to_s)

          all.select do |model|
            string_query_params.all? do |key, match_value|
              model[key] == match_value
            end
          end
        end
      end
    end
  end
end
