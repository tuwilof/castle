defmodule Esplanade do
    import Plug.Conn
  
    def init(options) do
      # initialize options
  
      options
    end
  
  def call(conn, _opts) do
    tomogram = [
        "/hello"
    ]
    IO.inspect(conn)
    if Enum.any?(tomogram, fn x -> x == conn.request_path end) do
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