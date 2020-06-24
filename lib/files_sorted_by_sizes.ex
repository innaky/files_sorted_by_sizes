defmodule FilesSortedBySizes do
  @moduledoc """
  Return a list of list with filenames of a directory sorted by size.
  """

  @doc """
  List greater. Return a list of list with filenames of a directory sorted by size.

  ## Examples

      iex> FilesSortedBySizes.lg(".")

  """
  def lg(filedir) do
    lst_name_size = lg_name_size(filedir)
    Enum.sort(lst_name_size, fn x, y -> List.last(x) > List.last(y) end)
  end

  @doc """
  Return a list of list with filenames of a directory.

  ## Examples

      iex> FilesSortedBySizes.lg_name_size(".")

  """
  def lg_name_size(filedir) do
    {:ok, lst_files} = File.ls(filedir)
    lst_files_abs = lg_abs(filedir, lst_files)
    lg_size(lst_files_abs)
  end

  @doc """
  Concatenate the output of `File.ls/1` with the `base_path` for all filenames.
  """
  def lg_abs(base_path, []), do: []
  def lg_abs(base_path, [h|t]) do
    [base_path <> "/" <> h | lg_abs(base_path, t)]
  end

  @doc """
  Extract the filename and the file.size of a list of files. Job with absolute filepaths
  """
  def lg_size([]), do: []
  def lg_size([h|t]) do
    [name_size(h) | lg_size(t)]
  end

  @doc """
  Return a list with the filename and filesize.
  """
  def name_size(filename) do
    {:ok, file} = File.lstat(filename)
    [filename, file.size]
  end
end
