defmodule MultiplyServer do
  use GenServer

  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_call(:value, _, state), do: {:reply, state, state}

  def handle_cast({:multiply, item}, state) when is_integer(item) do
    {:noreply, item * state}
  end
end

defmodule Multiply do
  def multiply(pid, b) when is_pid(pid) do
    GenServer.cast(pid, {:multiply, b})
    GenServer.call(pid, :value)
  end

  def multiply(a, b) do
    {:ok, pid} = GenServer.start_link(MultiplyServer, a)
    GenServer.cast(pid, {:multiply, b})
    GenServer.call(pid, :value)
  end
end

defmodule MultiTest do
  use ExUnit.Case
  doctest App

  test "multiply test" do
    assert Multiply.multiply(2, 3) == 6
    assert Multiply.multiply(1, 4) == 4
    assert Multiply.multiply(4, 7) == 28
  end

  test "genserver reuse" do
    {:ok, pid} = GenServer.start_link(MultiplyServer, 3)
    assert Multiply.multiply(pid, 4) == 12
    assert Multiply.multiply(pid, 2) == 24
    assert Multiply.multiply(pid, 30) == 720
  end
end
