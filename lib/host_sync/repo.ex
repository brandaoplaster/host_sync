defmodule HostSync.Repo do
  use Ecto.Repo,
    otp_app: :host_sync,
    adapter: Ecto.Adapters.Postgres
end
