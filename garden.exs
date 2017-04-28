defmodule Garden do

  @default_names ~w(alice bob charlie david eve fred ginny harriet leana joseph kincaid larry)a
  @plants %{?G => :grass, ?C => :clover, ?V => :violets, ?R => :radishes}
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t()) :: map
  def info(info_string) do
    info(info_string, @default_names)
  end

  @spec info(String.t(), list) :: map
  def info(info_string, student_names) do
    %{student_name => {}}
  end

end
