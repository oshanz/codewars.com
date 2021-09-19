defmodule Solution do
  def nb_year(p0, percent, aug, p) do
    nb_year(p0, percent, aug, p, 0)
  end

  defp nb_year(p0, _percent, _aug, p, year) when p0 >= p, do: year

  defp nb_year(p0, percent, aug, p, year) do
    population_at_the_end_of_year(p0, percent, aug)
    |> nb_year(percent, aug, p, 1 + year)
  end

  defp population_at_the_end_of_year(p0, percent, aug) do
    p0 + floor(p0 * percent / 100) + aug
  end
end
