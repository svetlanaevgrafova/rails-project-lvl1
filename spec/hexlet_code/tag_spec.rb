# frozen_string_literal: true

RSpec.describe HexletCode::Tag do
  describe '.build' do
    context 'with paired tags' do
      it 'returns paired tag html' do
        expect(HexletCode::Tag.build('div')).to eq('<div></div>')
      end
    end

    context 'with unpaired tags' do
      it 'returns unpaired tag html' do
        expect(HexletCode::Tag.build('br')).to eq('<br>')
      end
    end

    context 'with options' do
      it 'returns tag html with options' do
        expect(HexletCode::Tag.build('input', type: 'submit', value: 'Save'))
          .to eq('<input type="submit" value="Save">')
      end
    end

    context 'with block' do
      it 'returns tag html with block' do
        expect(HexletCode::Tag.build('label') { 'Email' }).to eq('<label>Email</label>')
      end
    end

    context 'with everything' do
      it 'returns tag html with everything' do
        expect(HexletCode::Tag.build('label', for: 'email') { 'Email' }).to eq('<label for="email">Email</label>')
      end
    end
  end
end
