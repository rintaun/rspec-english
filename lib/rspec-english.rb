require 'rspec/core/example_group'
require 'rspec/core/metadata'
require 'rspec/core/formatters/progress_formatter'
module ::RSpec
    def english; true end
    module Core
        class ExampleGroup
            def self.context(*args, &example_group_block)
                o = self.describe *args, &example_group_block
                o.metadata[:example_group][:type] = :context
                o
            end
        end
        class Metadata < Hash
            module GroupMetadataHash
                def full_description
                    front = []
                    back = []
                    container_stack.reverse.each do |part|
                        target = part[:type] == :context ? back : front
                        target.push part[:description_args]
                    end
                    [front, back].map {|s| [do_build_description(*s.flatten)] }
                end
            end
            module MetadataHash
                alias_method :do_build_description, :build_description_from

                def build_description_from(context, *parts)
                    context = [[context], [""]] unless context.is_a? Array
                    front, back = context
                    parts = front + parts + back
                    parts.delete_if(&:empty?)
                    do_build_description parts.shift, *parts
                end
            end
        end
    end
end
