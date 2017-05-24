defmodule Physics do
  @moduledoc """
  Documentation for Physics.
  """

  # alias Physics.Rocketry, as: Astrophysics
  # alias Physics.Laws
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Physics.Repo, [])
    ]

    opts = [strategy: :one_for_one, mame: Physics.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
