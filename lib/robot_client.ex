defmodule RobotClient do
  def start(file_name) do
    PositionServer.start

    "data/#{file_name}"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.each(fn command -> execute(command) end)
  end

  defp execute("PLACE " <> position_string) do
    [x, y, f] = String.split(position_string, ",")

    PositionServer.place(
      String.to_integer(x),
      String.to_integer(y),
      f
    )
  end

  defp execute("MOVE"), do: PositionServer.move
  defp execute("LEFT"), do: PositionServer.left
  defp execute("RIGHT"), do: PositionServer.right
  defp execute("REPORT"), do: PositionServer.report
end
