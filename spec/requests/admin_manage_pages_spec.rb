require 'spec_helper'

def visit_admin_path
http_login('osvaldo', 'pravo')
visit admin_path
end

describe "Manage Pages", :type => :feature do
  describe "As admin, when I click the manage pages link" do
    it "should take me to manage pages link" do
      visit_admin_path
      Page.create(name: "home")
      Page.create(name: "about")
      find_link('Manage Pages').click
      expect(page).to have_content("home")
      expect(page).to have_content("about")
    end
  end

  describe "create page" do
    it "should create new page" do
      visit_admin_path
      find_link('Manage Pages').click
      find_link('New Page').click
      expect(page).to have_content("Create new page")
      fill_in 'Name', with: "A test page"
      fill_in 'Title', with: "A test page"
      fill_in 'Content', with: "A test page"
      click_on('Save')
      expect(page).to have_content("A test page")
    end
  end

  describe "delete page" do
    it "should delete page" do
      visit_admin_path
      find_link('Manage Pages').click
      page.first(:link, 'Destroy')
      expect(page).to have_content 'Content'
    end
  end


  describe "edit page" do
    it "should edit page" do
      visit_admin_path
      find_link('Manage Pages').click
      page.first(:link, 'Edit')
      expect(page).to have_content 'Content'
    end
  end

 describe "new page" do
   it "should have page" do
     visit_admin_path
     find_link('Manage Pages').click
     find_link('New Page').click
     Page.create(name: "home")
     Page.create(title: "my home")
     Page.create(content: "content")
   end
 end


end