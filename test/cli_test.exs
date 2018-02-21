defmodule CLITest do
   use ExUnit.Case
   #doctest ProjIssues
  import Proj_issues.CLI ,only: [parse_args: 1]

  test ":working" do
    assert parse_args([]) == "you passed a list"
    assert parse_args(1) != "you passed a list"
  end

  #test ":failing" ,do:    assert parse_args(1) == "you passed a list"
end