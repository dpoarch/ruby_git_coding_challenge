require './libs/main.rb'
require "dotenv"
require "colorize"
require "octokit"
Dotenv.load

instance = OInstance.new

pull_req = instance.create_pull_requests(
    ENV['ACCESS_TOKEN'], 
    ENV['GIT_USERNAME'], 
    ENV['GIT_REPO'])

