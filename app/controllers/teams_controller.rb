# Slack team's EasyLunch app add, modify
class TeamsController < ApplicationController
  def new
    @params = {
      scope: 'commands,bot',
      client_id: ENV['slack_client_id'].to_s,
      redirect_uri: "#{ENV['root_url']}/teams/create"
    }
  end

  def create
    if params['error'].present?
      flash[:error] = params['error']
      redirect_to root_url
    else
      response = request_add_app(params[:code])
      register_team(response)
      register_user(response)
      render_add_app_result(response)
    end
  end

  private

    def request_add_app(auth_code)
      o_auth_uri = URI('https://slack.com/api/oauth.access')

      request_params = {
        code: auth_code,
        client_id: ENV['slack_client_id'],
        client_secret: ENV['slack_client_secret']
      }

      o_auth_uri.query = URI.encode_www_form(request_params)

      Net::HTTP.get_response(o_auth_uri)
    end

    def get_add_app_response_body(http_response)
      return unless http_response.is_a? Net::HTTPSuccess

      JSON.parse(http_response.body)
    end

    def register_team(http_response)
      return if (body = get_add_app_response_body(http_response)).nil?

      attrs = {
        access_token: body['access_token'],
        slack_team_name: body['team_name'], slack_team_id: body['team_id'],
        bot_access_token: body['bot']['bot_access_token']
      }

      existing_team = Team.find_by_slack_team_id(attrs[:slack_team_id])

      existing_team.nil? ? Team.create!(attrs) : existing_team.update(attrs)
    end

    def register_user(http_response)
      return if (body = get_add_app_response_body(http_response)).nil?

      if User.find_by_slack_uid(body['user_id']).nil?
        return if (team = Team.find_by_slack_team_id(body['team_id'])).nil?

        attrs = { team: team, slack_uid: body['user_id'] }

        User.create!(attrs)
      end
    end

    def render_add_app_result(http_response)
      if http_response.is_a? Net::HTTPSuccess
        render html: add_app_result_msg(JSON.parse(http_response.body))
      else
        render html: 'error: add app http request faild'
      end
    end

    def add_app_result_msg(http_response_body)
      if http_response_body['ok']
        'Welcome! EasyLunch successfully added to your team' \
        " #{http_response_body['team_name']}! :)"
      else
        "error: #{http_response_body['error']}"
      end
    end
end
