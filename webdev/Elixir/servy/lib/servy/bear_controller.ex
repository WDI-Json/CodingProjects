defmodule Servy.BearController do
  alias Servy.Wildthings

  def index(conv) do
    bears = Wildthings.list_bears()

    #TODO: transform to html list.
    %{ conv | status: 200, resp_body: "Teddy, Smokey, Paddington"}
  end

  def show(conv, %{"id" => id}) do
    %{ conv | status: 200, resp_body: "bear #{id}"}
  end

  def create(conv, %{"type" => type, "name" => name} = params) do
    %{ conv | status: 201,
    resp_body: "Created a #{type} bear named #{name}!"}
  end

end
