defmodule CompilerProblemTest do
  use ExUnit.Case
  import Converter

  # Do not understand the purpose of rounding an
  # integer.
  test "rounding an integer with 0 precision" do
    val = 19 |> round_to
    assert val == 19
  end

  test "rounding an integer" do
    val = 1.9 |> round_to
    assert val == 1.9
  end

  test "converting m to km" do
    val = 120.5 |> to_km
    assert val == 0.12050
  end
end
