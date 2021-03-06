defmodule EsplanadeTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Esplanade.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/hello", ~s({"login": "", "password": ""}))

    # Invoke the plug
    conn = Esplanade.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello world"
  end

  test "returns error requestNotDocumented" do
    # Create a test connection
    conn = conn(:get, "/hell")

    # Invoke the plug
    conn = Esplanade.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "requestNotDocumented"
  end

  test "returns error requestBodyIsInvalid" do
    # Create a test connection
    conn = conn(:get, "/hello")

    # Invoke the plug
    conn = Esplanade.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "requestBodyIsInvalid"
  end
end
