require "test_helper"

class BoardHandlerTest < ActionDispatch::IntegrationTest
  WIN_COUNT = 4

  test "winner_horizontal? == true" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [1, 0, 1, 1, 1 ,1 ,0],
    ]
    assert true == BoardHandler.winner_horizontal?(WIN_COUNT, board, 1, 5, 3)
  end

  test "winner_horizontal? == false" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [1, 0, 1, 1, 1 ,0 ,0],
    ]
    assert false == BoardHandler.winner_horizontal?(WIN_COUNT, board, 1, 5, 3)
  end

  test "winner_vertical? == true" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
    ]
    assert true == BoardHandler.winner_vertical?(WIN_COUNT, board, 1, 2, 2)
  end

  test "winner_vertical? == false" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
    ]
    assert false == BoardHandler.winner_vertical?(WIN_COUNT, board, 1, 3, 2)
  end

  test "winner_diagonal? == true" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 1, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 1, 0, 0, 0 ,0 ,0],
      [1, 0, 0, 0, 0 ,0 ,0],
    ]
    assert true == BoardHandler.winner_diagonal?(WIN_COUNT, board, 1, 2, 3)
  end

  test "winner_diagonal? == false" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 1, 0, 0, 0 ,0 ,0],
      [1, 0, 0, 0, 0 ,0 ,0],
    ]
    assert false == BoardHandler.winner_diagonal?(WIN_COUNT, board, 1, 3, 2)
  end

  test "winner_reverse_diagonal? == true" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 1, 0 ,0 ,0],
      [0, 0, 0, 0, 1 ,0 ,0],
      [0, 0, 0, 0, 0 ,1 ,0],
      [0, 0, 0, 0, 0 ,0 ,1],
    ]
    assert true == BoardHandler.winner_reverse_diagonal?(WIN_COUNT, board, 1, 2, 3)
  end

  test "winner_reverse_diagonal? == false" do
    board = [
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 0, 0, 0 ,0 ,0],
      [0, 0, 1, 0, 0 ,0 ,0],
      [0, 0, 0, 1, 0 ,0 ,0],
      [0, 0, 0, 0, 1 ,0 ,0],
    ]
    assert false == BoardHandler.winner_reverse_diagonal?(WIN_COUNT, board, 1, 3, 2)
  end
end
