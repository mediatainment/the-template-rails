require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EmailHelper. For example:
#
# describe EmailHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MercuryHelper, :type => :helper do

  it 'should return a valid HTML Tag' do

    id = "html-tag-id-string"
    regexp = /<("[^"]*"|'[^']*'|[^'">])*>/

    result = helper.make_mercury(id).match(regexp)
    expect(result).to_not be_nil

  end
end
