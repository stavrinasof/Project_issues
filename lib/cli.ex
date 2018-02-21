defmodule Proj_issues.CLI do
    @doc """
      'argv' can be -h or --help ,which returns :help
      """
    @default_count 4
    def run(argv) do
        argv
        |> parse_args
        |>process
    end

      
    def parse_args(argv) do
      OptionParser.parse(argv ,switches: [help: :boolean] ,aliases: [h: :help])
      |>elem(1)
      |>args_to_internal_rep()
    end

    def args_to_internal_rep([user,project,count]) do
        {user,project,String.to_integer(count)}
    end

    def args_to_internal_rep([user,project]) do
        {user,project,@default_count}
    end

    def args_to_internal_rep(_) do
        :help
    end

    def process(:help) do
        IO.puts """
        usage: issues <user> <project> [count | #{@default_count}]
        """
        System.halt(0)
    end

    def process({user,project,_count}) do
        Proj_issues.Github.fetch(user,project)
    end
end