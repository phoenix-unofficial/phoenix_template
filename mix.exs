defmodule PhoenixTemplate.MixProject do
  use Mix.Project

  @version "1.0.4"
  @source_url "https://github.com/phoenixframework/phoenix_template"

  def project do
    [
      app: :phoenix_template,
      version: @version,
      elixir: "~> 1.15",
      description: "Template rendering for Phoenix",
      docs: docs(),
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:eex]
    ]
  end

  defp docs do
    [
      main: "Phoenix.Template",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: ["CHANGELOG.md"]
    ]
  end

  defp deps do
    [
      {:phoenix_html, "~> 4.0", optional: true},
      {:jason, "~> 1.0", only: :test},
      {:ex_doc, "~> 0.37", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Chris McCord", "José Valim", "Gary Rennie"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
