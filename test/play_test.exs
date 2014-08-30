defmodule Poker.PlayTest do
  use ExUnit.Case, async: true
  alias Play.CLI
  import ExUnit.CaptureIO

  test "#command join terminator" do
    capture_io fn ->
      assert CLI.command(:join, []) == true
    end
  end

  test "#command join node" do
    capture_io fn ->
      assert CLI.command(:join, [Atom.to_string(node())]) == true
    end
  end

  @tag :distributed
  test "#command join distributed node" do
    capture_io fn ->
      assert CLI.command(:join, ["bar@127.0.0.1"]) == true
    end
    assert Node.list == ["bar@127.0.0.1"]
  end

  test "#command list" do
    assert capture_io(fn ->
      CLI.command(:list, [])
    end) == ""
  end

  @tag :distributed
  test "#command list with nodes" do
    assert node() == :"foo@127.0.0.1"
    assert Node.connect(:"bar@127.0.0.1") == true
    assert Node.list == ["bar@127.0.0.1"]
    assert capture_io(fn ->
      CLI.command(:list, [])
    end) == "bar@127.0.0.1\n"
  end

end
