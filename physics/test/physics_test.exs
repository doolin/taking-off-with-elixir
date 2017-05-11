defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "the truth" do
    assert 1 + 1 == 2
  end

  test 'escape velocity of earth is correct' do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test 'escape velocity of planet X is correct' do
    planet_x = %{mass: 4.0e22, radius: 6.21e6}
    ev = planet_x |> Physics.Rocketry.escape_velocity
    assert ev == 1.0
  end

  test "Converter 1 works" do
    c = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    # c |> IO.puts # IO.puts returns :ok
    assert c == 0.00537
  end
end
