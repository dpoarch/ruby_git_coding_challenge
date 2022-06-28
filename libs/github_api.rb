require "dotenv"
require "github_api"
require "colorize"

class GitInstance
    def repoList(git_username)
        repo = Github.repos.list user: git_username

        return repo
    end

    def loadAccessToken(access_token)
        contents = Github::Client::Repos::Contents.new oauth_token: access_token
        return contents
    end

    def paginate_repos(git_username)
        repos    = Github::Client::Repos.new
        response = repos.list user: git_username, per_page: 10, page: 5

        return paginate_repos
    end

    def create_commit_push_event(access_token, git_username, git_repo, push_file)
        contents = Github::Client::Repos::Contents.new oauth_token: access_token

        contents.create git_username, git_repo, push_file,
                    path: push_file,
                    message: 'initial commit',
                    content: 'sample file push.'

        return contents
    end

    def update_commit_event(access_token, git_username, git_repo, push_file)
        contents = Github::Client::Repos::Contents.new oauth_token: access_token, user: git_username, repo: git_repo

        file = contents.find path: "#{push_file}"

        contents.update git_username, git_repo, push_file,
        path: push_file,
        message: 'Updated files',
        content: 'Updated/Added the files..',
        sha: file.sha

        puts "\n Updated successfully: ".colorize(:light_magenta) + "#{contents}"

        return contents
    end

    def create_starring_event(access_token, git_username, git_repo)
        starred = Github::Client::Activity::Starring.new oauth_token: access_token
        starred.star git_username, git_repo
        
        puts "\nSuccessfully starred: ".colorize(:light_magenta) + "#{starred}"
    
        return starred
    end

    def create_event(git_username, git_repo)
        response = Github::Client::Repos.branches git_username, git_repo
        response.headers.ratelimit_limit     # "5000"
        response.headers.ratelimit_remaining # "4999"
        response.headers.status              # "200"
        response.headers.content_type        # "application/json; charset=utf-8"
        response.headers.etag                # "\"2c5dfc54b3fe498779ef3a9ada9a0af9\""
        response.headers.cache_control       # "public, max-age=60, s-maxage=60"

        events = Github::Client::Activity::Events.new
        events.public headers: {
            'X-Poll-Interval': 60,
            'ETag': "a18c3bded88eb5dbb5c849a489412bf3"
        }

        return events
    end

    def delete_pushed_event(access_token, git_username, git_repo, push_file)
        contents = Github::Client::Repos::Contents.new oauth_token: access_token

        file = contents.find path: "#{push_file}"

        contents.delete user: git_username, repo: git_repo,
                    path: push_file,
                    message: 'initial commit',
                    sha: file.sha

        return contents
    end
end