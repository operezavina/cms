class AdminController < ApplicationController
  http_basic_authenticate_with name: "osvaldo", password: "pravo"
  def dashboard
  end
end
