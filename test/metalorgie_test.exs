defmodule MetalorgieTest do
  use ExUnit.Case
  doctest Metalorgie

  test "get_band for band `korn`" do
    {:ok, json} = Metalorgie.get_band(["korn"])
    assert json["name"] == "Korn"
  end

  test "get_band for band `nopnop`" do
    {:error, message} = Metalorgie.get_band(["nopnop"])
    assert message == "No band with name nopnop found"
  end

  test "get_album for album `follow the leader` by `korn`" do
    {:ok, album} = Metalorgie.get_album(["korn"], String.split("Follow the Leader", " "))
    assert album["name"] == "Follow the leader"
    assert album["year"] == "1998"
  end

  test "get_album for album `nop` by band `iron maiden`" do
    {:error, message} = Metalorgie.get_album(["iron", "maiden"], ["nop"])
    assert message == "No album named nop found for artist iron maiden"
  end
end
