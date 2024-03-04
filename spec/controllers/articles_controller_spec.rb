require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Article, type: :system do
    before do
        @title = "Hello World"
        @body = "this is my 1st article test"
        @body_less_than_10 = "aaa"
        @status = "public"
    end



    it "creates a new article" do
        visit new_article_path
        sleep(1)
        fill_in "article[title]", with: @title
        sleep(1)
        fill_in "article[body]", with: @body
        sleep(1)
        select @status, from: "article[status]"
        sleep(1)
        attach_file 'article[image]',"/home/aymen/blog/app/assets/images/attach for test.gif"
        sleep(1)
        click_button "Create Article"
        sleep(1)
        expect(page).to have_text(/#{@title}/i)
        sleep(1)
    end

    it "article with no title dont pass" do
        visit new_article_path
        sleep(1)
        fill_in "article[body]", with: @body
        sleep(1)
        select @status, from: "article[status]"
        sleep(1)
        attach_file 'article[image]',"/home/aymen/blog/app/assets/images/attach for test.gif"
        sleep(1)
        click_button "Create Article"
        sleep(1)
        expect(page).to have_text(/new article/i)
        sleep(1)
    end

    it "article with no body dont pass" do
        visit new_article_path
        sleep(1)
        fill_in "article[title]", with: @title
        sleep(1)
        select @status, from: "article[status]"
        sleep(1)
        attach_file 'article[image]',"/home/aymen/blog/app/assets/images/attach for test.gif"
        sleep(1)
        click_button "Create Article"
        sleep(1)
        expect(page).to have_text(/new article/i)
        sleep(1)
    end

    it "article with body length less than 10 dont pass" do
        visit new_article_path
        sleep(1)
        fill_in "article[title]", with: @title
        sleep(1)
        fill_in "article[body]", with: @body_less_than_10
        sleep(1)
        select @status, from: "article[status]"
        sleep(1)
        attach_file 'article[image]',"/home/aymen/blog/app/assets/images/attach for test.gif"
        sleep(1)
        click_button "Create Article"
        sleep(1)
        expect(page).to have_text(/new article/i)
        sleep(1)
    end

    it "article with no image passees" do
        visit new_article_path
        sleep(1)
        fill_in "article[title]", with: @title
        sleep(1)
        fill_in "article[body]", with: @body_less_than_10
        sleep(1)
        select @status, from: "article[status]"
        sleep(1)
        click_button "Create Article"
        sleep(1)
        expect(page).to have_text(/new article/i)
        sleep(1)
    end
end
