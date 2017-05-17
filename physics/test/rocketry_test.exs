defmodule RocketryTest do
  use ExUnit.Case
  import Physics.Rocketry

  @tag :skip
  test "orbital acceleration defaults to earth" do
    # TODO: pass in precision
    x = orbital_acceleration(100)
    assert x == 9.515619587729839
  end

  @tag :skip
  test "orbital term at 100km" do
    # TODO: pass in precision
    x = orbital_term(100)
    assert x == 1.4
  end

  @tag :skip
  test "orbital acceleration for Jupiter at 100km" do
    # assert x == 24.670096337229204
  end

  @tag :skip
  test "orbital acceleration for Saturn at 6000km" do
    # assert x == 4.9
  end
end
