defmodule Garden do

  @default_names ~w(alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry)a
  @plants %{?G => :grass, ?C => :clover, ?V => :violets, ?R => :radishes}
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_names) do
    Enum.sort(student_names)
      |> Enum.zip(_tuplify(info_string))
      |> Enum.reduce(_blank_map(student_names), fn({name, plants}, acc) -> Map.merge(acc, %{ name => plants }) end)
  end

  defp _blank_map(student_names) do
    Enum.reduce(student_names, %{}, fn(student_name, acc) -> Map.merge(acc, %{student_name => {}}) end)
  end

  defp _tuplify(info_string) do
    String.split(info_string, "\n")
      |> Enum.map(fn(plants) -> Enum.chunk(to_charlist(plants),2) end)
      |> Enum.zip
      |> Enum.reduce([], fn(data, acc) -> acc ++ _atomize_plants(data) end)
  end

  defp _atomize_plants({a,b}) do
    [Enum.reduce(a ++ b, {}, fn(p, acc) -> Tuple.append(acc, @plants[p]) end)]
  end



end
