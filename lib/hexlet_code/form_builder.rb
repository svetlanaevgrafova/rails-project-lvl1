# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :result

    def initialize(person)
      @person = person
      @result = String.new
    end

    # rubocop:disable Naming/MethodParameterName
    def input(person_methods, as: nil, **kvargs)
      # rubocop:enable Naming/MethodParameterName
      value = @person.public_send(person_methods)
      @result << "\n"
      @result <<
        if as.nil?
          options = { name: person_methods.to_s, type: "text", value: value }.merge(kvargs)
          HexletCode::Tag.build("input", **options)
        else
          options = { cols: 20, rows: 40, name: person_methods.to_s }.merge(kvargs)
          HexletCode::Tag.build("textarea", **options) { value }
        end
    end
  end
end
