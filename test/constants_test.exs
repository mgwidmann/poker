defmodule Poker.ConstantsTest.ConstantModule do
  use Poker.Constants

  constant something, 10
  define   another,   "String"
end

defmodule Poker.ConstantsTest do
  use ExUnit.Case, async: true
  require Poker.ConstantsTest.ConstantModule
  alias Poker.ConstantsTest.ConstantModule, as: Const

  test "#constant has an externally accessible constant" do
    assert Const.something == 10
  end

  test "#define has an externally accessible constant" do
    assert Const.another == "String"
  end
end
