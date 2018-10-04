defmodule Esplanade do
    import Plug.Conn
  
    def init(options) do
      # initialize options
  
      options
    end
  
  def call(conn, _opts) do
    tomogram = Poison.decode!(File.read!("test/api2.json"))
    #IO.inspect(conn)
    if !Enum.any?(tomogram, fn x -> x["path"] == conn.request_path end) do
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "requestNotDocumented")
    else
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "Hello world")
    end
  end
end