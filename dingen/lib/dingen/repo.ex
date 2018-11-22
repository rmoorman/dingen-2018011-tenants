defmodule Dingen.Repo do
  use Ecto.Repo,
    otp_app: :dingen,
    adapter: Ecto.Adapters.Postgres
end
