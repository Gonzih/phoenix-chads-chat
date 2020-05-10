defmodule ChadWeb.PageLive do
  use ChadWeb, :live_view

  @topic "chads"

  @impl true
  def mount(_params, _session, socket) do
    ChadWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, name: "chad#{:rand.uniform(100)}", messages: [])}
  end

  @impl true
  def handle_event("send-message", %{"message" => message}, %{assigns: %{name: name}} = socket) do
    ChadWeb.Endpoint.broadcast(@topic, "message", %{name: name, message: message})
    {:noreply, socket}
  end

  @impl true
  def handle_info(%{topic: @topic, payload: msg}, socket) do
    {:noreply,
      socket
      |> update(:messages, fn l -> [msg | l] end)}
  end
end
