# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    let(:user) { User.new(name: "rob", job: "hexlet", gender: "m") }

    context "with user" do
      it "return standart form tag" do
        expect(HexletCode.form_for(user)).to eq("<form action=\"#\" method=\"post\">\n</form>")
      end
    end

    context "with user and url" do
      it "return form tag with url" do
        expect(HexletCode.form_for(user, url: "/users")).to eq("<form action=\"/users\" method=\"post\">\n</form>")
      end
    end

    context "with user and block" do
      it "return " do
        expected_result = File.read("spec/fixtures/html_form_1.html")
        result = HexletCode.form_for user do |f|
          f.input :name
          f.input :job
        end
        expect(result).to eq(expected_result)
      end
    end
  end
end
