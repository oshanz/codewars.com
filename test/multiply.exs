defmodule MultiplyServer do
  use GenServer
  def handle_call(:value, _, state), do: {:reply, state, state}
  def handle_cast({:multiply, item}, state) when is_integer(item) do
    {:noreply, item * state}
  end
end

defmodule Multiply do
  def multiply(a, b) do
    {:ok, pid} = GenServer.start_link(MultiplyServer, a)
    GenServer.cast(pid, {:multiply, b})
    GenServer.call(pid, :value)
  end
end
