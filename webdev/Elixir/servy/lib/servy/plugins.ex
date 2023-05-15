defmodule Servy.Plugins do
  require Logger
  alias Servy.Conv

  def track(%Conv{status: 404, path: path} = conv) do
    Logger.warning("#{path} on the loose logged.")
    IO.puts("Warning #{path} is on the loose!")
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings"}
  end

  def rewrite_path(%Conv{path: "/about"} = conv) do
    %{conv | path: "/pages/about"}
  end

  def rewrite_path(%Conv{path: "/bears/new"} = conv) do
    %{conv | path: "/pages/form"}
  end

  def rewrite_path(%Conv{path: path} = conv) do
    regex = ~r{\/(?<thing>\w+)\?id=(?<id>\d+)}
    captures = Regex.named_captures(regex, path)
    rewrite_path_captures(conv, captures)
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def rewrite_path_captures(%Conv{} = conv, %{"thing" => thing, "id" => id}) do
    %{conv | path: "/#{thing}/#{id}"}
  end

  def rewrite_path_captures(%Conv{} = conv, nil), do: conv

  def log(%Conv{} = conv), do: IO.inspect(conv)

  def emojify(%Conv{status: 200} = conv) do
    emojies = String.duplicate("🚀", 5)
    body = emojies <> "\n" <> conv.resp_body <> "\n" <> emojies

    %{conv | resp_body: body}
  end

  def emojify(%Conv{} = conv), do: conv
end
