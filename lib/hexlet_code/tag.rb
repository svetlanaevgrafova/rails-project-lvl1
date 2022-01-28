# frozen_string_literal: true

module HexletCode
  class Tag
    UNPAIRED_TAGS = %w[meta img link br hr input area param col base].freeze
    class << self
      def build(tag, **kvargs, &block)
        result = []

        result << '<'
        result << tag
        add_hash(result, kvargs) if kvargs.any?
        result << '>'

        unless UNPAIRED_TAGS.include? tag
          add_block(result, block) if block_given?
          result << "</#{tag}>"
        end
        result.join
      end

      private

      def add_hash(result, kvargs)
        kvargs.each do |k, v|
          result << " #{k}=\"#{v}\""
        end
      end

      def add_block(result, block)
        result << block.call.to_s
      end
    end
  end
end
