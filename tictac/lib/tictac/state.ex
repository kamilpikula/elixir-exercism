defmodule Tictac.State do
 alias Titcat.{Square, State}
 @players [:x, :o]

 # statues are :initial, choose_pl, playing, game_over, winner_reported
 defstruct status: :initial,
           turn: nil,
           winner: nil,
           board: Square.new_board(),
           ui: nil

  def name(), do: {:ok, %State{}}
  def name(ui), do: {:ok, %State{ui: ui}}

  def event(%State{status: initial} = state, {:choose_pl, player}) do
    case Tictac.check_player(player) do
      {:ok, p} -> {:ok, %State{state | status: :playing, turn: p}}
      _        -> {:error, :invalid_player}
    end
  end

  def event(%State{status: :playing}, {:play, p}) when p not in @players do
    {:error, :invalid_player}
  end

  def event(%State{status: :playing, turn: p} = state, {:play, p}) do
    {:ok, %State{state | turn: other_player(p)}}
  end

  def event(%State{status: :playing}, {:play, _}) do
    {:error, :out_of_turn}
  end

  def event(%State{status: :playing}, {:check_for_winner, winner}) do
    case winner in @players do
      :x    -> {:ok, %State{state | status: :game_over, winner: winner}}
      :o    -> {:ok, %State{state | status: :game_over, winner: winner}}
      _       -> {:error, :invalid_winner}
    end
  end

  def event(%State{status: :playing} = state, {:game_over?, over_or_not}) do
    case over_or_not do
      :not_over   -> {:ok, state}
      :game_over  -> {:ok, %State{state | status: :game_over?, :game_over, winner: :tie}}
      _           -> {:error, :invalid_game_over_status}
    end
  end



  def other_player(p) do
    case p do
      :x -> :o
      :o -> :x
      _  -> {:error, :invalid_player}
    end
  end
end
