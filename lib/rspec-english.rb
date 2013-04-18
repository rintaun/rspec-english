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
                    desc_parts = container_stack.reverse.collect { |a|
                        this_part = a[:description_args]
                        this_part = this_part.join(' ')
                        if a[:type] == :context
                            def this_part.after?; end
                        end
                        this_part
                    }
                end
            end
            module MetadataHash
                def build_description_from(context, *parts)
                    front = []
                    if context.is_a?(Array)
                        context.each do |this_part|
                            if this_part.respond_to? :after?
                                parts.push this_part
                            else
                                front.push this_part
                            end
                        end
                    else
                        parts.unshift context
                    end
                    front.reverse.each do |part|
                        parts.unshift part
                    end
                    parts.join(' ')
                end
            end
        end
    end
end
