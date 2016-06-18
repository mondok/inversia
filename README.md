# Inversia
### WIP
Inversia is an inverted index for Elixir.  For the time being, it is a record-level inverted index rather than a word-level.  This may change in the future.  

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add inversia to your list of dependencies in `mix.exs`:

        def deps do
          [{:inversia, "~> 0.0.1"}]
        end

  2. Ensure inversia is started before your application:

        def application do
          [applications: [:inversia]]
        end
