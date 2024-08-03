defmodule HelloWorld do
  @greet "hello"

  def greet(whom \\ "world")
  def greet("" <> whom), do: "#{@greet} #{name(whom)}"

  def greet(whom) when is_list(whom) do
    case count = count(whom) do
      0 -> {:error, :no_one}
      1 -> whom |> List.first() |> greet()
      _ -> "#{@greet} #{count} people"
    end
  end

  defp name(whom) do
    Regex.run(~r/^\w+/, whom) |> List.first()
  end

  defp count([]), do: 0
  defp count([_ | rest]), do: count(rest) + 1
end
