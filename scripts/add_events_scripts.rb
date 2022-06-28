require './libs/github_api.rb'
require "dotenv"
require "colorize"
require "github_api"
Dotenv.load

gitInstance = GitInstance.new

gitInstance.create_starring_event(
    ENV['ACCESS_TOKEN'], 
    ENV['GIT_USERNAME'], 
    ENV['GIT_REPO'])
