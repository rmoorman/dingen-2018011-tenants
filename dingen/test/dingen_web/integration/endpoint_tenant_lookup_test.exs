defmodule DingenWeb.EndpointTenantLookupTest do
  use DingenWeb.ConnCase

  describe "Endpoint" do
    test "adds tenant to assigns for matching host", %{conn: conn} do
      host = "dingen.net"
      tenant = Dingen.create_tenant(%{host: host})

      conn = %{conn | host: host}
      conn = get(conn, "/")

      assert DingenWeb.TenantLookupPlug.get_tenant(conn) == tenant
    end
  end
end
