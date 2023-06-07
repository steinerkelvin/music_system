defmodule MusicSystemTest do
  use ExUnit.Case
  doctest MusicSystem

  test "greets the world" do
    assert MusicSystem.hello() == :world
  end
end
