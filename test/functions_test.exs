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
end

defmodule FuncTest do
  use ExUnit.Case
  doctest App

  test "functions test" do
    assert Funct.a(12) == :a
  end
end
