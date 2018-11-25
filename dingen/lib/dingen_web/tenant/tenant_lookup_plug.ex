defmodule DingenWeb.Tenant.LookupPlug do
  import Plug.Conn
  alias Plug.Conn

  alias Dingen.Tenant

  @private_field :dingen_tenant

  ###
  ### Plug interface
  ###

  def init(opts), do: opts

  def call(%Conn{} = conn, _opts) do
    case Dingen.get_tenant_by_host(conn.host) do
      %Tenant{} = tenant -> put_tenant(conn, tenant)
      _ -> conn
    end
  end

  ###
  ###
  ###

  def put_tenant(%Conn{} = conn, tenant) do
    put_private(conn, @private_field, tenant)
  end

  def get_tenant(%Conn{} = conn) do
    get_in(conn.private, [@private_field])
  end
end
