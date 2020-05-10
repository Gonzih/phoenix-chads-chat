defmodule Chad.Repo do
  use Ecto.Repo,
    otp_app: :chad,
    adapter: Ecto.Adapters.Postgres
end
