defmodule Position do
  defstruct [:x, :y, :f]

  @size 5

  def new() do
    %__MODULE__{}
  end

  def place(%__MODULE__{}, x, y, f) when x >= 0 and x < @size and y >= 0 and y < @size, do: %__MODULE__{x: x, y: y, f: f}
  def place(%__MODULE__{} = position, _x, _y, _f), do: position

  def move(%__MODULE__{x: x, y: y, f: "NORTH"}) when x >= 0 and x < @size and y >= 0 and y < @size, do: %__MODULE__{x: x, y: (y + 1), f: "NORTH"}
  def move(%__MODULE__{x: x, y: y, f: "SOUTH"}) when x >= 0 and x < @size and y >= 0 and y < @size, do: %__MODULE__{x: x, y: (y - 1), f: "SOUTH"}
  def move(%__MODULE__{x: x, y: y, f: "WEST"}) when x >= 0 and x < @size and y >= 0 and y < @size, do: %__MODULE__{x: (x - 1), y: y, f: "WEST"}
  def move(%__MODULE__{x: x, y: y, f: "EAST"}) when x >= 0 and x < @size and y >= 0 and y < @size, do: %__MODULE__{x: (x + 1), y: y, f: "EAST"}
  def move(%__MODULE__{} = position), do: position

  def report(%__MODULE__{} = position), do: IO.inspect(position)

  def left(%__MODULE__{f: "NORTH"} = position), do: %__MODULE__{position | f: "WEST"}
  def left(%__MODULE__{f: "WEST"} = position), do: %__MODULE__{position | f: "SOUTH"}
  def left(%__MODULE__{f: "SOUTH"} = position), do: %__MODULE__{position | f: "EAST"}
  def left(%__MODULE__{f: "EAST"} = position), do: %__MODULE__{position | f: "NORTH"}

  def right(%__MODULE__{f: "NORTH"} = position), do: %__MODULE__{position | f: "EAST"}
  def right(%__MODULE__{f: "EAST"} = position), do: %__MODULE__{position | f: "SOUTH"}
  def right(%__MODULE__{f: "SOUTH"} = position), do: %__MODULE__{position | f: "WEST"}
  def right(%__MODULE__{f: "WEST"} = position), do: %__MODULE__{position | f: "NORTH"}
end
