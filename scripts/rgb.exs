defmodule RGB do
  defstruct red: 0, green: 0, blue: 0, alpha: nil

  def new, do: %RGB{}

  def new(r, g, b, a \\ nil) do
    %RGB{red: r, green: g, blue: b, alpha: a}
  end

  def print(%RGB{red: r, green: g, blue: b, alpha: nil}) do
    "#{r} #{g} #{b}"
  end

  def print(%RGB{red: r, green: g, blue: b, alpha: a}) do
    "#{r} #{g} #{b} / #{a}"
  end

  def parse("#" <> hex), do: parse_hex(hex)

  def parse(values) when is_bitstring(values) do
    {alpha, rgb} = capture(values)

    [r, g, b] = Enum.map(rgb, &String.to_integer/1)
    a = normalise(alpha)

    {:ok, new(r, g, b, a)}
  end

  defp capture(values) do
    ~r/(\d+)[,\s]+(\d+)[,\s]+(\d+)[,\s\/]+([.0-9]*%?)/
    |> Regex.run(values, capture: :all_but_first)
    |> List.pop_at(-1)
  end

  defp normalise(alpha) do
    cond do
      alpha == "" -> nil
      alpha =~ "%" -> percent(alpha)
      true -> number(alpha)
    end
  end

  defp percent(value) do
    {number, _} = Float.parse(value)
    number / 100
  end

  defp number(value) do
    {number, _} = Float.parse(value)
    if number > 1, do: number / 255, else: number
  end

  defp parse_hex(<<r, g, b>>), do: parse_hex(<<r, r, g, g, b, b>>)
  defp parse_hex(<<r, g, b, a>>), do: parse_hex(<<r, r, g, g, b, b, a, a>>)

  defp parse_hex(<<r::2-bytes, g::2-bytes, b::2-bytes>>) do
    {:ok, new(x(r), x(g), x(b))}
  end

  defp parse_hex(<<r::2-bytes, g::2-bytes, b::2-bytes, a::2-bytes>>) do
    {:ok, new(x(r), x(g), x(b), x(a) / 255)}
  end

  defp x(hex), do: String.to_integer(hex, 16)
end
