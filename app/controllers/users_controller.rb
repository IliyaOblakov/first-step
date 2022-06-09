require "json"
require "open-uri"
require "dotenv"

class UsersController < ApplicationController
  def show
    @user = current_user
    token = ENV["NHS_API_KEY"][1...50]
    url = "https://api.nhs.uk/service-search?api-version=2&$orderby=OrganisationName"
    url_s = URI.open(url, "subscription-key" => token).read
    info = JSON.parse(url_s)
    @infos = info["value"]
  end
end
