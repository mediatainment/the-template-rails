require 'rails_helper'

RSpec.describe "articles/edit", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
                                  :title => "MyString",
                                  :subtitle => "MyString",
                                  :content => "MyString",
                                  :published => false,
                                  :featured => false,
                                  :meta_description => "MyString"
                              ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_subtitle[name=?]", "article[subtitle]"

      assert_select "input#article_content[name=?]", "article[content]"

      assert_select "input#article_published[name=?]", "article[published]"

      assert_select "input#article_featured[name=?]", "article[featured]"

      assert_select "input#article_meta_description[name=?]", "article[meta_description]"
    end
  end
end
