defmodule Proj_issues.Github do
  @user_agent [{"User-agent","Elixir dave@pragprog.com"}]
	@github_url Application.get_env(:proj_issues, :github_url)

	require Logger

	def fetch(user,project) do
		Logger.info("Fetching #{user}'s project #{project}")
		
		issues_url(user,project)
		|> HTTPoison.get(@user_agent)
		|>handle_response
	end
	
	def issues_url(user, project) do
		"#{@github_url}/repos/#{user}/#{project}/issues"
	end

	def handle_response({ _, %{status_code: st_code, body: body}}) do
		Logger.info("Got response: status code=#{st_code}")
		Logger.debug(fn -> inspect(body) end)
		{
			st_code |> check_for_error() ,
			body |> Poison.Parser.parse!()
		}
	end

	def check_for_error(200) ,do: :ok
	def check_for_error(_) ,do: :error
end