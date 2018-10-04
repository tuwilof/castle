defmodule Esplanade do
    import Plug.Conn
  
    def init(options) do
      # initialize options
  
      options
    end
  
  def call(conn, _opts) do
    IO.inspect(conn)
    if conn.request_path == "/hello" do
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "Hello world")
    else
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "requestNotDocumented")
    end
  end
end