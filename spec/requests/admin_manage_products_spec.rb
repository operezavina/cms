require 'spec_helper'

def visit_admin_path
  http_login('osvaldo', 'pravo')
  visit admin_path
end

describe "Manage Products", :type => :feature do
  describe "As admin, when I click the manage products link" do
    it "should take me to manage products link" do
      visit_admin_path
      Product.create(name: "home")
      Product.create(name: "about")
      find_link('Manage Products').click
      expect(page).to have_content("home")
      expect(page).to have_content("about")
    end
  end

  describe "create product" do
    it "should create new product" do
      visit_admin_path
      find_link('Manage Products').click
      find_link('New Product').click
      expect(page).to have_content("Create new product")
      fill_in 'Name', with: "A test page"
      fill_in 'Description', with: "A test page"
      fill_in 'Price', with: 34
      click_on('Save')
      expect(page).to have_content("A test page")
    end
  end

  describe "delete product" do
    it "should delete product" do
      visit_admin_path
      find_link('Manage Products').click
      page.first(:link, 'Destroy')

    end
  end


  describe "edit product" do
    it "should edit product" do
      visit_admin_path
      find_link('Manage Products').click
      page.first(:link, 'Edit')
    end
  end

  describe "new product" do
    it "should have product" do
      visit_admin_path
      find_link('Manage Products').click
      find_link('New Product').click
      Product.create(name: "Lap")
      Product.create(description: "my home")
      Product.create(price: 45.5)
    end
  end


end