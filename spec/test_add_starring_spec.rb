require './libs/github_api.rb'
require "dotenv"
require "github_api"

Dotenv.load

describe GitInstance do
    let(:gitInstance) {GitInstance.new}
    
    it "should add a starring" do
        responseCode = gitInstance.create_starring_event(
            ENV['ACCESS_TOKEN'], 
            ENV['GIT_USERNAME'], 
            ENV['GIT_REPO'])
    end
end