defmodule Physics.Rocketry do
  import Converter
  import Calcs
  import Physics.Laws, only: [newtons_gravitational_constant: 0]
  import Planets

  def escape_velocity(:earth), do: earth() |> escape_velocity
  def escape_velocity(:mars),  do: mars() |> escape_velocity
  def escape_velocity(:moon), do: moon() |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet |> calculate_escape
           |> Converter.to_km
           |> Converter.to_nearest_tenth
  end

  def orbital_speed(height) do
    newtons_gravitational_constant() * Planets.earth.mass / orbital_radius(height)
      |> square_root
  end

  # TODO: monorail the units here to ensure the conversions are correct,
  # because at the moment they are not correct.
  def orbital_height(term) do
    divisor = 4 * (:math.pi |> squared)
    numerator = newtons_gravitational_constant() * Planets.earth.mass * (term |> squared)
    (((numerator / divisor) |> cube_root) - Planets.earth.radius) |> to_km
  end

  def cube_root(arg) do
    :math.exp(:math.log(arg)/3)
  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) /
    (newtons_gravitational_constant() * earth().mass)
    |> square_root
    |> seconds_to_hours
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height) |> to_nearest_hundredth
  end

  defp orbital_radius(height) do
    Planets.earth.radius + (height |> to_meters)
  end

  defp rounded_to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  defp convert_to_km(velocity) do
    velocity / 1000
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant() * mass / radius |> square_root
  end
end
