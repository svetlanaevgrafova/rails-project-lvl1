# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload('FormBuilder', 'hexlet_code/form_builder.rb')
  autoload('Tag', 'hexlet_code/tag.rb')

  class << self
    def form_for(person, url: '#', **kvargs, &block)
      options = { action: url, method: 'post' }.merge(kvargs)

      HexletCode::Tag.build('form', **options) do
        f = HexletCode::FormBuilder.new(person)
        block.call(f) if block_given?
        "#{f.result}\n"
      end
    end
  end
end
