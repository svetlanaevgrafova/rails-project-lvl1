# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    let(:user) { User.new(name: "rob", job: "hexlet", gender: "m") }

    context "with user" do
      it "returns standart form tag" do
        expect(HexletCode.form_for(user)).to eq("<form action=\"#\" method=\"post\">\n</form>")
      end
    end

    context "with user and url" do
      it "returns form tag with url" do
        expect(HexletCode.form_for(user, url: "/users")).to eq("<form action=\"/users\" method=\"post\">\n</form>")
      end
    end

    context "with user and block" do
      it "returns form for user" do
        expected_result = File.read("spec/fixtures/html_form_1.html")
        result = HexletCode.form_for user do |f|
          f.input :name, class: "lg"
          f.input :job, as: :text, id: :job_text_field
        end
        expect(result).to eq(expected_result)
      end
    end

    context "with user and block" do
      it "throws error" do
        expect do
          HexletCode.form_for user do |f|
            f.input :name
            f.input :age
          end
        end.to raise_error(NoMethodError, /undefined method `age'/)
      end
    end
  end
end
