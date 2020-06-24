# FilesSortedBySizes

### Usage

```elixir
iex> FilesSortedBySizes.lg(".")
[["./erlg.ex", 1058], ["./#erlg.ex#", 1085]]
```

## Installation

The package can be installed, by adding `files_sorted_by_sizes` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:files_sorted_by_sizes, git: "innaky/files_sorted_by_sizes", tag: "v0.1.0"}
  ]
end
```
