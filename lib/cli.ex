defmodule Proj_issues.CLI do
    def run(argv) do
        parse_args(argv)
    end

    def parse_args(argv) do
        parse = is_list(argv)
        case parse do
            true -> "you passed a list"
            false -> "expected a list"
        end
    end
end