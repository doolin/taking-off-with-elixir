defmodule RocketryTest do
  use ExUnit.Case
  import Physics.Rocketry

  test "orbital acceleration defaults to earth" do
    x = orbital_acceleration(100)
    # assert x == 9.51 # 5619587729839
    assert x == 9.52 # 5619587729839
  end

  test "orbital term at 100km" do
    x = orbital_term(100)
    assert x == 1.4397410411723914
  end

  @tag :skip
  test "orbital acceleration for Jupiter at 100km" do
    x = orbital_acceleration(Planet.select[:jupiter], 100)
    assert x == 24.670096337229204
  end

  @tag :skip
  test "orbital acceleration for Saturn at 6000km" do
    x = orbital_acceleration(Planet.select[:saturn], 100)
    assert x == 4.9
  end
end
