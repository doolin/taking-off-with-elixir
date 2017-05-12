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

  def to_nearest_hundredth(val) do
    Float.ceil(val, 2)
  end

  def seconds_to_hours(val) do
    val / 3600.0
  end

  # def to_km(val) when is_integer(val)do # from book, p. 83 code commit
  def to_km(val) do
    val / 1000
  end

  def to_meters(val) do
    val * 1000
  end

  def to_light_seconds({:miles, miles}, precision: precision) do
    (miles * 5.36819e-6) |> round_to(precision)
  end

  def to_light_seconds({:meters, meters}, precision: precision) do
    (meters * 3.335638620368e-9) |> round_to(precision)
  end

  def to_light_seconds({:feet, feet}, precision: precision) do
    (feet * 1.016702651488166404e-9) |> round_to(precision)
  end

  def to_light_seconds({:inches, inches}, precision: precision)  do
    (inches * 8.472522095734715723e-11) |> round_to(precision)
  end

  def seconds_to_hours(val)  when is_integer(val) or is_float(val) do
    val / 3600 |> to_nearest_tenth
  end

  def round_to(val, precision \\ 5)

  # Don't understand what the purpose of this is.
  def round_to(val, precision) when is_integer(val) do
    val
  end

  def round_to(val, precision) when is_float(val) do
    Float.round(val, precision)
  end
end
