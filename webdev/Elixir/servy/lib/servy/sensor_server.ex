defmodule Servy.SensorServer do
  @process_name :sensor_server

  use GenServer

  defmodule State do
    defstruct refresh_interval: :timer.minutes(60), sensor_data: %{}
  end

  # Client Interface
  def start_link(interval) do
    initial_state = %State{refresh_interval: :timer.minutes(interval)}
    IO.puts("Starting the Sensor Server with interval of #{IO.inspect(interval)} minutes...")
    GenServer.start_link(__MODULE__, initial_state, name: @process_name)
  end

  @spec get_sensor_data() :: any()
  def get_sensor_data, do: GenServer.call(@process_name, :get_sensor_data)

  def set_refresh_interval(time_in_ms),
    do: GenServer.cast(@process_name, {:set_refresh_interval, time_in_ms})

  # Server Callbacks

  def init(state) do
    sensor_data = run_tasks_to_get_sensor_data()
    initial_state = %{state | sensor_data: sensor_data}
    schedule_refresh(state.refresh_interval)
    {:ok, initial_state}
  end

  def handle_info(:refresh, state) do
    IO.puts("Refreshing the cache...")
    sensor_data = run_tasks_to_get_sensor_data()
    new_state = %{state | sensor_data: sensor_data}
    schedule_refresh(state.refresh_interval)
    {:noreply, new_state}
  end

  def handle_info(unexpected, state) do
    IO.puts("Can't touch this! #{inspect(unexpected)}")
    {:noreply, state}
  end

  defp schedule_refresh(time_in_ms) do
    Process.send_after(self(), :refresh, time_in_ms)
  end

  def handle_cast({:set_refresh_interval, time_in_ms}, state) do
    new_state = %{state | refresh_interval: time_in_ms}
    {:noreply, new_state}
  end

  def handle_call(:get_sensor_data, _from, state) do
    {:reply, state.sensor_data, state}
  end

  defp run_tasks_to_get_sensor_data do
    IO.puts("Running tasks to get sensor data...")

    task = Task.async(fn -> Servy.Tracker.get_location("bigfoot") end)

    snapshots =
      ["cam-1", "cam-2", "cam-3"]
      |> Enum.map(&Task.async(fn -> Servy.VideoCam.get_snapshot(&1) end))
      |> Enum.map(&Task.await/1)

    where_is_bigfoot = Task.await(task)

    %{snapshots: snapshots, location: where_is_bigfoot}
  end
end
