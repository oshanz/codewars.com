defmodule Kata do
  def find_outlier(integers) do
    majorityis(integers) |> outliner(integers)
  end

  defp majorityis(ints) do
    require Integer
    {even, _} = Enum.frequencies_by(ints, &Integer.is_even/1) |> Enum.max_by(&elem(&1, 1))
    if even, do: :even, else: :odd
  end

  defp outliner(arg, ints) do
    require Integer
    oppo = if :even == arg, do: &Integer.is_odd/1, else: &Integer.is_even/1
    Enum.find(ints, oppo)
  end
end
