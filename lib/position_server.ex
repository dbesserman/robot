defmodule PositionServer do
  use GenServer

  def start, do: GenServer.start(__MODULE__, Position.new, name: __MODULE__)
  def place(x, y, f), do: GenServer.cast(__MODULE__, {:place, x, y, f})
  def move, do: GenServer.cast(__MODULE__, {:move})
  def left, do: GenServer.cast(__MODULE__, {:left})
  def right, do: GenServer.cast(__MODULE__, {:right})
  def report, do: GenServer.call(__MODULE__, {:report})

  def init(%Position{} = new_position), do: {:ok, new_position}
  def handle_cast({:place, x, y, f}, position), do: {:noreply, Position.place(position, x, y, f)}
  def handle_cast({:move}, position), do: {:noreply, Position.move(position)}
  def handle_cast({:left}, position), do: {:noreply, Position.left(position)}
  def handle_cast({:right}, position), do: {:noreply, Position.right(position)}
  def handle_call({:report}, _from_pid, position), do: {:reply, Position.report(position), position}
end
