defmodule HandlerTest do
  use ExUnit.Case, async: true
  import Servy.Handler, only: [handle: 1]

  test "GET /wildthings" do
    request = """
    GET /wildthings HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = handle(request)

    assert response == """
           HTTP/1.1 200 OK\r
           Content-Type: text/html\r
           Content-Length: 65\r

           🚀🚀🚀🚀🚀\r
           Bears, Lions, Tigers\r
           🚀🚀🚀🚀🚀\r
           """
  end

  test "DELETE /wildthings" do
    request = """
    DELETE /bears/1 HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = handle(request)

    assert response == """
           HTTP/1.1 403 Forbidden\r
           Content-Type: text/html\r
           Content-Length: 34\r

           Bear with 1 must never be deleted!
           """
  end

  test "GET /bigfoot" do
    request = """
    GET /bigfoot HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = handle(request)

    assert response == """
           HTTP/1.1 404 Not Found\r
           Content-Type: text/html\r
           Content-Length: 17\r

           No /bigfoot here!
           """
  end

  test "GET /api/bears" do
    request = """
    GET /api/bears HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = handle(request)

    expected_response = """
    HTTP/1.1 200 OK\r
    Content-Type: application/json\r
    Content-Length: 650\r
    🚀🚀🚀🚀🚀\r
    [{"hibernating":true,"type":"Brown","name":"Teddy","id":1},{"hibernating":false,"type":"Black","name":"Smokey","id":2},{"hibernating":false,"type":"Brown","name":"Paddington","id":3},{"hibernating":true,"type":"Grizzly","name":"Scarface","id":4},{"hibernating":false,"type":"Polar","name":"Snow","id":5},{"hibernating":false,"type":"Grizzly","name":"Brutus","id":6},{"hibernating":true,"type":"Black","name":"Rosie","id":7},{"hibernating":false,"type":"Panda","name":"Roscoe","id":8},{"hibernating":true,"type":"Polar","name":"Iceman","id":9},{"hibernating":false,"type":"Grizzly","name":"Kenai","id":10}]
    🚀🚀🚀🚀🚀
    """

    assert remove_whitespace(response) == remove_whitespace(expected_response)
  end

  test "POST /api/bears" do
    request = """
    POST /api/bears HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    Content-Type: application/json\r
    Content-Length: 21\r
    \r
    {"name": "Breezly", "type": "Polar"}
    """

    response = handle(request)

    assert response == """
           HTTP/1.1 201 Created\r
           Content-Type: text/html\r
           Content-Length: 35\r

           Created a Polar bear named Breezly!
           """
  end

  test "GET /pages/faq" do
    request = """
    GET /pages/faq HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = handle(request)

    expected_response = """
    HTTP/1.1 200 OK\r
    Content-Type: text/html\r
    Content-Length: 697
    🚀🚀🚀🚀🚀
    <h1>FrequentlyAskedQuestions</h1><ul><li><p><strong>HaveyoureallyseenBigfoot?</strong></p><p>Yes!Inthis<ahref="https://www.youtube.com/watch?v=ZMBeN4Kr4LE">totallybelievablevideo</a>!</p></li><li><p><strong>No,ImeanseenBigfoot<em>ontherefuge</em>?</strong></p><p>Oh!Notyet,butwe’re<em>stilllooking</em>…</p></li><li><p><strong>Canyoujustshowmesomecode?</strong></p><p>Sure!Here’ssomeElixir:</p><pre><codeclass="elixir">[&quot;Bigfoot&quot;,&quot;Yeti&quot;,&quot;Sasquatch&quot;]|&gt;Enum.random()</code></pre></li></ul>
    🚀🚀🚀🚀🚀
    """

    assert remove_whitespace(response) == remove_whitespace(expected_response)
  end

  defp remove_whitespace(text) do
    String.replace(text, ~r{\s}, "")
  end
end
