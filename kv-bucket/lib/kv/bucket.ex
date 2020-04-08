defmodule KV.Bucket do
  @moduledoc """
  Bucket for store
  """

  use Agent

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Split into client code and server
  Puts a `key` and `value` to the `bucket`
  """
  def put(bucket, key, value) do
    # Here is the client code
    Agent.update(bucket, fn state ->
      # Here is the server code
      Map.put(state, key, value)
    end)
  end
  @doc """
  Deletes `key` from `bucket`.

  Returns the current value of `key`, if `key` exists.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn dict ->
      Map.pop(dict, key)
    end)
  end
end
