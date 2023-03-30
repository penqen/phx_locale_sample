defmodule LocalSampleWeb.RestoreLocale do
  import Phoenix.Component

  alias LocalSample.Locale

  def on_mount(:default, %{"locale" => locale}, _session, socket) do
    Gettext.put_locale(LocalSampleWeb.Gettext, locale)
    socket = socket
    |> assign(:locale, locale)
    |> Phoenix.LiveView.attach_hook(:save_request_path, :handle_params, &save_request_path/3)
    {:cont, socket}
  end

  def on_mount(:default, _params, _session, socket) do
    socket = socket
    |> assign(:locale, Locale.get_default_locale())
    |> Phoenix.LiveView.attach_hook(:save_request_path, :handle_params, &save_request_path/3)

    {:cont, socket}
  end

  defp save_request_path(_params, url, socket), do:
    {:cont, Phoenix.Component.assign(socket, :current_path, URI.parse(url).path)}

end
