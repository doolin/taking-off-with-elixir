defmodule Physics.Planet do
  defstruct [
    name: "Earth",
    radius: 6.371e6,
    mass: 5.97e24
  ]

  # def escape_velocity(planet) do
    #   g = 6.67e-11
    # gmr = 2 * g * planet.mass/planet.radius_m
    # vms = :math.sqrt gmr
    # vkms = vms/1000
    # Float.ceil vkms, 1
    # end

  # v = %Physics.Planet{} |> Physics.Planet.escape_velocity
end

defmodule ConverterTwo do
  def to_light_seconds(arg), do: to_light_seconds(arg, precision: 5)

  def to_light_seconds({unit, val}, precision: precision) do
    light_seconds = case unit do
      :miles -> from_miles(val)
      :meters -> from_meters(val)
      :feet -> from_feet(val)
      :inches -> from_inches(val)
    end
    light_seconds |> round_to(precision)
  end

  defp from_miles(val), do: val * 5.36819e-6
  defp from_meters(val), do: val * 3.335638620368e-9
  defp from_feet(val), do: val * 1.016702651488166404e-9
  defp from_inches(val), do: val * 8.472522095734715723e-11
  defp round_to(val, precision \\ 5), do: Float.round(val, precision)
end

defmodule Converter do
  def to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  def to_km(val) do
    val / 1000
  end

  def to_meters(val) do
    val * 1000
  end

  def to_light_seconds({:miles, miles} = val, precision: precision) do
    (miles * 5.36819e-6) |> round_to(precision)
  end

  def to_light_seconds(%{meters: meters} = val, precision: precision) do
    (meters * 3.335638620368e-9) |> round_to(precision)
  end

  def to_light_seconds({:feet, feet} = val, precision: precision) do
    (feet * 1.016702651488166404e-9) |> round_to(precision)
  end

  def to_light_seconds({:inches, inches} = val, precision: precision)  do
    (inches * 8.472522095734715723e-11) |> round_to(precision)
  end

  defp round_to(val, precision) when is_float(val) when is_float(val) do
    Float.round(val, precision)
  end
end

defmodule Physics.Rocketry do
  def escape_velocity(:earth) do
    %{mass: 5.97e24, radius: 6.371e6} |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet |> calculate_escape # (%{mass: mass, radius: radius})
           |> Converter.to_km
           |> Converter.to_nearest_tenth
  end

  defp rounded_to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  defp convert_to_km(velocity) do
    velocity / 1000
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    2 * newtons_constant * mass / radius |> :math.sqrt
  end
end

defmodule Convertor do
  def to_nearest_tenth(val) do
    Float.round(val, 1)
  end
end