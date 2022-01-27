# frozen_string_literal: true

module HexletCode
  class Magic
    attr_reader :result

    def initialize(person)
      @person = person
      @result = String.new
    end

    def input(person_methods)
      value = @person.public_send(person_methods)
      @result << "\n"
      @result << HexletCode::Tag.build("input", name: person_methods.to_s, type: "text", value: value)
    end
  end
end
