require 'spec_helper'

require 'spec_helper'

describe "AdminPage", :type => :feature do
  describe "When I visit the Admin page" do
    it "should ask me for authentication" do
      visit admin_path
    end
  end
end

