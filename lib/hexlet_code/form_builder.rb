# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :result

    def initialize(person)
      @person = person
      @result = String.new
    end

    # rubocop:disable Naming/MethodParameterName
    def input(field_name, as: nil, **kvargs)
      # rubocop:enable Naming/MethodParameterName
      value = @person.public_send(field_name)
      put_label(field_name)
      @result << "\n"
      @result <<
        if as.nil?
          options = { name: field_name.to_s, type: 'text', value: value }.compact.merge(kvargs)
          HexletCode::Tag.build('input', **options)
        else
          options = { cols: 20, rows: 40, name: field_name.to_s }.merge(kvargs)
          HexletCode::Tag.build('textarea', **options) { value }
        end
    end

    def put_label(field_name)
      @result << "\n"
      @result << HexletCode::Tag.build('label', for: field_name.to_s) { field_name.to_s.capitalize }
    end

    def submit(text_field = 'Save', **kvargs)
      @result << "\n"
      options = { name: 'commit', type: 'submit', value: text_field.to_s }.merge(kvargs)
      @result << HexletCode::Tag.build('input', **options)
    end
  end
end
