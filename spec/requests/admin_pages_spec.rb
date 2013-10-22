require 'spec_helper'

describe "AdminPage", :type => :feature do
  describe "When I visit the Admin page" do
    it "should ask me for authentication" do
      visit admin_path
      expect(page.status_code).to eq 401
    end
  end

  describe "When I am logged in and visit the Admin page" do
    it "should let me see the admin dashboard" do
      http_login('osvaldo', 'pravo')
      visit admin_path
      expect(page).to have_content("Admin Dashboard")
    end
  end

  describe "Dashboard page" do
    it "should have a link to manage pages" do
      http_login('osvaldo', 'pravo')
      visit admin_path
      expect(page).to have_css('a#manage_pages')
    end
  end



end

