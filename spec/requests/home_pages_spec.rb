require 'spec_helper'

describe "HomePage", :type => :feature do
  describe "When I visit the homepage" do
    it "should have a welcome message" do
      visit root_path
      expect(page).to have_content("Welcome to my website")
      expect(page).to have_content('Blog')
      click_on('Blog')
    end
  end

  describe "When I visit menu on homepage" do
    it "should have a the next items" do
      visit root_path
      find_link("Homepage")
      find_link('Blog')
      find_link('Photos')
      find_link('About')
      find_link('Links')
      find_link('Contact')
      click_on('Blog')
     end
  end

  describe "When I visit admin section" do
    it "should have a protect" do
      visit admin_path
      http_login('osvaldo', 'pravo')

    end
  end


end

