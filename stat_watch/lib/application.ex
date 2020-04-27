defmodule StatWatch.Application do
  use Application

  def start(_type, _args) do
    children = [
      {StatWatch.Scheduler, []}
    ]

    opts = [strategy: :one_for_one, name: StatWatch.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
