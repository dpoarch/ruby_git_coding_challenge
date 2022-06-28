require './libs/main.rb'
require "dotenv"
require "octokit"

Dotenv.load

describe OInstance do
    let(:oinstance) {OInstance.new}
    
    it "should create an issues event" do
        # responseCode = oinstance.create_pull_requests(
        #     ENV['ACCESS_TOKEN'], 
        #     ENV['GIT_USERNAME'], 
        #     ENV['GIT_REPO'])
    end
end