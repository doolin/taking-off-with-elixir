defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "the truth" do
    assert 1 + 1 == 2
  end

  describe "escape_velocity" do
    test 'of earth is correct' do
      assert Physics.Rocketry.escape_velocity(:earth) == 11.2
    end

    test 'of mars is correct' do
      assert Physics.Rocketry.escape_velocity(:mars) == 5.1
    end

    test 'of moon is correct' do
      assert Physics.Rocketry.escape_velocity(:moon) == 2.4
    end

    test 'of planet X is correct' do
      planet_x = %{mass: 4.0e22, radius: 6.21e6}
      ev = planet_x |> Physics.Rocketry.escape_velocity
      assert ev == 1.0
    end
  end

  describe "orbital_height" do
    @tag :skip
    test "for period 4 hours" do
      height = Physics.Rocketry.orbital_height(4 * 3600)
      assert height == 1.0
    end
  end

  describe "orbital_term" do
   test "for 100km above earth" do
     term = Physics.Rocketry.orbital_term(100)
     assert term == 1.4397410411723914
   end
  end

  describe "orbital_acceleration" do
    test 'at 100 km is 9.51' do
      assert Physics.Rocketry.orbital_acceleration(100) == 9.51
    end
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
