defmodule Funct do
  def a(x) when x > 10 do
    :a
  end

  def a(x) when x > 1 do
    :b
  end

  def a(_x) do
    :c
  end

  def sum_named(x, y) do
    sum = fn a, b -> a + b end
    sum.(x, y)
  end

  def sum_anon(x, y) do
    sum = &(&1 + &2)
    sum.(x, y)
  end

  def pattern_matching_functions() do
    fn
      a, b when a > b -> a + b
      a, b -> a * b
    end
  end
end

defmodule FuncTest do
  use ExUnit.Case
  doctest App

  test "functions test" do
    assert Funct.a(12) == :a
  end

  test "sum named" do
    assert Funct.sum_named(4, 5) == 9
  end

  test "sum anonym" do
    assert Funct.sum_anon(3, 5) == 8
  end

  test "pattern matching fucntion" do
    assert Funct.pattern_matching_functions().(8, 3) == 11
    assert Funct.pattern_matching_functions().(4, 5) == 20
  end
end
