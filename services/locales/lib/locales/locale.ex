defmodule LocalSample.Locale do
  def get_default_locale() do
    Application.get_env(:locales, LocalSampleWeb.Gettext)[:default_locale]
  end

  def get_local(url) do
    ~r/\/(?<locale>[a-z]{2})((\/.*)?$)/
    |> Regex.named_captures(url)
    |> case do
      %{"locale" => locale} ->
        locale
      _ ->
        get_default_locale()
    end
  end

  def replace_locale(url, new_locale) do
    ~r/\/([a-z]{2})(?<path>(\/.*)?$)/
    |> Regex.named_captures(url)
    |> case do
      %{"path" => path} ->
        "/#{new_locale}#{path}"
      _ ->
        "/#{new_locale}#{url}"
    end
  end
end
