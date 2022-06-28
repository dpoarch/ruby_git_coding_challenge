require "dotenv"
require "colorize"
require "octokit"

class OInstance
    def get_repos(access_token)
        client = Octokit::Client.new(:access_token => access_token, auto_paginate: true)
        user = client.user
        repos = client.repos(user.login)

        puts "\nListed Repos:"
        repos.select! do |repo|
            puts "#{repo.name} \n".colorize(:light_magenta)
        end

        response = client.last_response
        
        return response.status
    end

    def create_commit_push_event(access_token, git_username, git_repo, push_file)
        contents = Octokit::Client.new(:access_token => access_token)
        contents.create_contents("#{git_username}/#{git_repo}",
            "#{push_file}",
            "Added Sample.txt file",
            :file => push_file,
            :branch => "main")
        response = contents.last_response

        puts "\nSuccessfully pushed: ".colorize(:light_magenta) + "#{contents}"

        return response.status
    end

    def create_issue_event(access_token, git_username, git_repo)
        issues = Octokit::Client.new(:access_token => access_token, auto_paginate: true)

        issues.create_issue("#{git_username}/#{git_repo}", 'Issue on sample.txt file', 'Added some extra links')

        puts "Successfully created a new Issue:".colorize(:light_magenta) + "#{issues}"
        
        response = issues.last_response

        return response.status
    end

    def create_milestone_issue_event(access_token, git_username, git_repo)

        issues = Octokit::Client.new(:access_token => access_token, auto_paginate: true)

        issues.create_milestone("#{git_username}/#{git_repo}", "0.7.0", {
            :title => 'v1.0', 
            :state => 'open', 
            :description => 'Add support for v3 of Github API', 
            :due_on => '2012-10-09T23:39:01Z'})

        puts "Successfully created a milestone:".colorize(:light_magenta) + "#{issues}"

        response = issues.last_response

        return response.status
    end

    def create_pull_requests(access_token, git_username, git_repo)
        request = Octokit::Client.new(:access_token => access_token)

        request.create_pull_request("#{git_username}/#{git_repo}", "master", "main",
            "Pull Request title", "Pull Request body")

        puts "Successfully made a pull request:".colorize(:light_magenta) + "#{request}"

        response = request.last_response
        
        return response.status
    end
end