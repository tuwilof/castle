defmodule Esplanade do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, opts) do
    {:ok, body, conn} = Plug.Conn.read_body(conn)
    json_body = json_body(body)

    tomogram = Poison.decode!(File.read!("test/api2.json"))

    cond do
      !Enum.any?(tomogram, fn request -> path_documented?(conn, request) end) ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "requestNotDocumented")

      !Enum.any?(tomogram, fn request -> valid_body?(json_body, request) end) ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "requestBodyIsInvalid")

      true ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "Hello world")
    end
  end

  defp json_body("") do
    %{}
  end

  defp json_body(raw_body) do
    Poison.decode!(raw_body)
  end

  defp path_documented?(conn, request) do
    request["path"] == conn.request_path
  end

  defp valid_body?(body, request) do
    IO.inspect(body)
    IO.inspect(ExJsonSchema.Validator.validate(request["request"], body))
    ExJsonSchema.Validator.valid?(request["request"], body)
  end
end
