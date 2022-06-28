require './libs/github_api.rb'
require "dotenv"
require "colorize"
require "github_api"
Dotenv.load

gitInstance = GitInstance.new

gitInstance.update_commit_event(
    ENV['ACCESS_TOKEN'], 
    ENV['GIT_USERNAME'], 
    ENV['GIT_REPO'],
    ENV['PUSH_FILE'])


