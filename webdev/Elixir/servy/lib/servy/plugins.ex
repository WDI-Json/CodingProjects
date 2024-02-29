defmodule Servy.Plugins do
  alias Servy.Conv
  require Logger

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{conv | method: "GET", path: "/wildthings"}
  end

  def rewrite_path(%Conv{path: path} = conv) do
    regex = ~r{\/(?<thing>\w+)\?id=(?<id>\d+)}
    captures = Regex.named_captures(regex, path)
    rewrite_path_captures(conv, captures)
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def rewrite_path_captures(conv, %{"thing" => thing, "id" => id}) do
    %{conv | path: "/#{thing}/#{id}}"}
  end

  def rewrite_path_captures(%Conv{} = conv, nil), do: conv

  def track(%Conv{status: 404, path: path} = conv) do
    Logger.warning(
      "Warning: ⚠️⚠️⚠️ #{path} is not recognized as a valid endpoint⚠️⚠️⚠️",
      date: DateTime.utc_now(),
      request_id: to_string(:erlang.ref_to_list(:erlang.make_ref()))
    )

    Servy.FourOhFourCounter.bump_count(path)
    conv
  end

  def track(%Conv{} = conv), do: conv

  def log_start(%Conv{} = conv) do
    Logger.info("#{conv.path} received. \nchecking for bad input🔍🔍🔍")
    conv
  end

  def log_progress(%Conv{} = conv) do
    Logger.info("Pre-checks succes✅. Formatting response")
    conv
  end
end
