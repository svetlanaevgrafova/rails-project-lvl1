# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

module HexletCode
  class << self
    def form_for(person, **kvargs, &block)
      kvargs[:action] = kvargs.delete(:url) || "#"
      kvargs[:method] = "post"
      HexletCode::Tag.build("form", kvargs) do
        "\n"
      end
    end
  end
end
