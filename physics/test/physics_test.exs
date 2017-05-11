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

  describe "Converter" do
    test "miles to light_seconds" do
      c = Converter.to_light_seconds({:miles, 1000}, precision: 15)
      # c |> IO.puts # IO.puts returns :ok
      assert c == 0.00536819
    end

    test 'meters to light_seconds' do
      c = Converter.to_light_seconds({:meters, 1000}, precision: 15)
      assert c == 3.33563862e-6
    end

    test 'feet to light_seconds' do
      c = Converter.to_light_seconds({:feet, 1000}, precision: 15)
      assert c == 1.016702651e-6
    end

    test 'inches to light_seconds' do
      c = Converter.to_light_seconds({:inches, 1000}, precision: 15)
      assert c == 8.4725221e-8
    end
  end

  describe "ConverterTwo" do
    test "miles to light_seconds" do
      c = ConverterTwo.to_light_seconds({:miles, 1000}, precision: 15)
      assert c == 0.00536819
    end

    test 'meters to light_seconds' do
      c = ConverterTwo.to_light_seconds({:meters, 1000}, precision: 15)
      assert c == 3.33563862e-6
    end

    test 'feet to light_seconds' do
      c = ConverterTwo.to_light_seconds({:feet, 1000}, precision: 15)
      assert c == 1.016702651e-6
    end

    test 'inches to light_seconds' do
      c = ConverterTwo.to_light_seconds({:inches, 1000}, precision: 15)
      assert c == 8.4725221e-8
    end
  end
end
