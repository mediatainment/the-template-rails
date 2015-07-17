require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
                        Article.create!(
                            :title => "Title",
                            :subtitle => "Subtitle",
                            :content => "Content",
                            :published => false,
                            :featured => false,
                            :meta_description => "Meta Description"
                        ),
                        Article.create!(
                            :title => "Title",
                            :subtitle => "Subtitle",
                            :content => "Content",
                            :published => false,
                            :featured => false,
                            :meta_description => "Meta Description"
                        )
                    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Meta Description".to_s, :count => 2
  end
end
