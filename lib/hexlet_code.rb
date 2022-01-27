# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/form_builder"

module HexletCode
  class << self
    def form_for(person, **kvargs, &block)
      kvargs[:action] = kvargs.delete(:url) || "#"
      kvargs[:method] = "post"

      HexletCode::Tag.build("form", kvargs) do
        f = HexletCode::FormBuilder.new(person)
        block.call(f) if block_given?
        "#{f.result}\n"
      end
    end
  end
end
