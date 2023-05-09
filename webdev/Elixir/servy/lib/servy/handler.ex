defmodule Servy.Handler do
  def handle(request) do
    request
    |> parse
    |> route
    |> format_response
  end

  def parse(request) do
    # TODO parse request string into a map
    conv = %{method: "GET", path: "/wildthings", resp_body: ""}
  end

  def route(conv) do
    # TODO create new map that also has a response body
    conv = %{method: "GET", path: "/wildthings", resp_body: "Bears, Lions, Tigers"}
  end

  def format_response(conv) do
    # TODO: Use values in the map to create HTTP response string
    """
    HTTP/1.1 200 OK
    Content-type: text/html
    Content-length: 20

    Bears, Lions, Tigers
    """
  end
end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: Examplebrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts(response)