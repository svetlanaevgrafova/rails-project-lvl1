# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    User = Struct.new(:name, :job, keyword_init: true)
    user = User.new name: "rob"

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
  end
end
