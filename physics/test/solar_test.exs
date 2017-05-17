defmodule SolarTest do
  use ExUnit.Case
  use Timex

  setup do
    flares = [
      %{classification: :X, scale: 99, date: Date.from_erl({1859, 8, 29})},
      %{classification: :M, scale: 5.8, date: Date.from_erl({2015, 1, 12})},
      %{classification: :M, scale: 1.2, date: Date.from_erl({2015, 2, 9})},
      %{classification: :C, scale: 3.2, date: Date.from_erl({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from_erl({2015, 6, 23})},
      %{classification: :C, scale: 2.5, date: Date.from_erl({2015, 7, 4})},
      %{classification: :X, scale: 72, date: Date.from_erl({2012, 7, 23})},
      %{classification: :X, scale: 45, date: Date.from_erl({2003, 11, 4})}
    ]
    {:ok, data: flares}
  end

  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "Go inside", %{data: flares} do
    d = Solar.no_eva(flares)
    assert length(d) == 3
  end

  test "extract deadliest", %{data: flares} do
    d = Solar.deadliest(flares)
    assert d == 99000
  end

  test "total flare power using recursion", %{data: flares} do
    power = Solar.total_flare_power(flares)
    assert power == 147717.966
  end

  @tag :skip
  test "total flare power using enums", %{data: flares} do
    power = Solar.total_flare_power_enum(flares)
    assert power == 147717.966
  end

  test "a list of flares", %{data: flares} do
    result = Solar.flare_list(flares)
    assert result == [
      {:power, 99000, :is_deadly, true},
      {:power, 58.0, :is_deadly, false},
      {:power, 12.0, :is_deadly, false},
      {:power, 3.2, :is_deadly, false},
      {:power, 836.0, :is_deadly, false},
      {:power, 2.5, :is_deadly, false},
      {:power, 72000, :is_deadly, true},
      {:power, 45000, :is_deadly, true}
    ]
  end

  test "a flare list with comprehensions", %{data: flares} do
    result = Solar.flare_list(flares)
    assert result == [
      {:power, 99000, :is_deadly, true},
      {:power, 58.0, :is_deadly, false},
      {:power, 12.0, :is_deadly, false},
      {:power, 3.2, :is_deadly, false},
      {:power, 836.0, :is_deadly, false},
      {:power, 2.5, :is_deadly, false},
      {:power, 72000, :is_deadly, true},
      {:power, 45000, :is_deadly, true}
    ]
  end

  @tag :skip
  test "a flare list with enums", %{data: flares} do
    Solar.flare_list_enums(flares) |> IO.inspect
    result = Solar.flare_list_enums(flares) |> IO.inspect
    assert result == [
      {:power, 99000, :is_deadly, true},
      {:power, 58.0, :is_deadly, false},
      {:power, 12.0, :is_deadly, false},
      {:power, 3.2, :is_deadly, false},
      {:power, 836.0, :is_deadly, false},
      {:power, 2.5, :is_deadly, false},
      {:power, 72000, :is_deadly, true},
      {:power, 45000, :is_deadly, true}
    ]
  end
end
