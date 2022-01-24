# frozen_string_literal: true

module HexletCode
  class Tag
    UNPAIRED_TAGS = %w[meta img link br hr input area param col base].freeze

    def build(tag, **kvargs, &block)
      result = []
      if UNPAIRED_TAGS.include? tag
        result << "<"
        result << tag
        put_the_hash(result, kvargs) if kvargs.any?
        result << ">"
      else
        result << "<"
        result << tag
        put_the_hash(result, kvargs) if kvargs.any?
        result << ">"
        put_the_block(result, block) if block_given?
        result << "</#{tag}>"
      end
      result.join
    end

    private

    def put_the_hash(result, kvargs)
      kvargs.each do |k, v|
        result << " #{k}=\"#{v}\""
      end
    end

    def put_the_block(result, block)
      result << block.call.to_s
    end
  end
end
