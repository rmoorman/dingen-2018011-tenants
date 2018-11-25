defmodule DingenWeb.EndpointTenantLookupTest do
  use DingenWeb.ConnCase

  describe "Endpoint" do
    test "adds tenant to assigns for matching host", %{conn: conn} do
      host = "dingen.net"
      {:ok, tenant} = Dingen.create_tenant(%{host: host})

      conn = %{conn | host: host}
      conn = get(conn, "/")

      assert DingenWeb.Tenant.LookupPlug.get_tenant(conn) == tenant
    end

    test "halts conn when no matching host was found", %{conn: conn} do
      conn = get(conn, "/")

      assert response(conn, 404) == "Not found"
      assert conn.halted
    end
  end
end
