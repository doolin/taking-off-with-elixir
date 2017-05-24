defmodule Choir do
  @voices ["Bells", "Good News", "Pipe Organ", "Cellos", "Bad News"]

  def sing do
    {:ok, pid} = Singer.start_link
    Enum.map 1..20, fn(n) ->
      voice = Enum.random(@voices)
      Singer.sing_it pid, voice
    end
  end
end

defmodule Singer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def sing_it(pid, data) do
    GenServer.cast(pid, {:sing, data})
  end

  def handle_cast({:sing, voice}, _state) do
    IO.puts "Singing with voice #{voice}"
    System.cmd "say", ["-v", voice, "Elixir is awesome"]
    {:noreply, []}
  end
end
