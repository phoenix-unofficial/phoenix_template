defmodule PhoenixTemplate.MixProject do
  use Mix.Project

  @version "1.0.0"
  @description "Template rendering for Phoenix"
  @source_url "https://github.com/phoenix-unofficial/phoenix_template"
  @changelog_url "https://github.com/phoenix-unofficial/phoenix_template/blob/v#{@version}/CHANGELOG.md"

  def project do
    [
      app: :phoenix_template,
      version: @version,
      elixir: "~> 1.15",
      deps: deps(),
      description: @description,
      source_url: @source_url,
      homepage_url: @source_url,
      docs: docs(),
      package: package(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:eex]
    ]
  end

  defp deps do
    [
      {:phoenix_html, "~> 4.0", optional: true},
      {:ex_check, ">= 0.0.0", only: [:dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:mix_audit, ">= 0.0.0", only: [:dev], runtime: false},
      {:jason, "~> 1.0", only: [:dev, :test]}
    ]
  end

  defp docs do
    [
      extras: ["CHANGELOG.md"],
      main: "Phoenix.Template",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => @changelog_url
      }
    ]
  end

  defp aliases do
    [publish: ["tag"], tag: &tag_release/1]
  end

  defp tag_release(_) do
    Mix.shell().info("Tagging release as v#{@version}")
    System.cmd("git", ["tag", "v#{@version}"])
    System.cmd("git", ["push", "--tags"])
  end
end
