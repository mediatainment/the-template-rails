require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "MyString",
      :subtitle => "MyString",
      :content => "MyString",
      :published => false,
      :featured => false,
      :meta_description => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_subtitle[name=?]", "article[subtitle]"

      assert_select "input#article_content[name=?]", "article[content]"

      assert_select "input#article_published[name=?]", "article[published]"

      assert_select "input#article_featured[name=?]", "article[featured]"

      assert_select "input#article_meta_description[name=?]", "article[meta_description]"
    end
  end
end
