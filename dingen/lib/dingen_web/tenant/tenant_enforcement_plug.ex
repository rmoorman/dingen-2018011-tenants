defmodule DingenWeb.Tenant.EnforcementPlug do
  import Plug.Conn
  alias Plug.Conn

  alias DingenWeb.Tenant.LookupPlug

  ###
  ### Plug interface
  ###

  def init(opts), do: opts

  def call(%Conn{} = conn, _opts) do
    case LookupPlug.get_tenant(conn) do
      nil ->
        conn
        |> resp(404, "Not found")
        |> halt()

      _ ->
        conn
    end
  end
end
