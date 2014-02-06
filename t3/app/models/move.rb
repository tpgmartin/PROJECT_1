class Move < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :position, :token

  belongs_to :user, class_name: 'User'
  belongs_to :game

  validate :game_is_not_finished
  validate :player_has_not_won
  validate :not_a_tie
  validate :player_is_playing_game
  validate :is_players_turn
  validate :square_is_in_bounds
  validate :square_is_not_occupied
  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :position, presence: true
  validates :token, presence: true



  private
  def game_is_not_finished
    # raise "Game has finished"  if @game.game_is_finished?
    errors.add :game_id, "has finished" if game.game_is_finished?
  end

  private
  def player_has_not_won
    # raise "Player has won" if @game.hasWon?
    errors.add :user_id, "has won" if game.hasWon?
  end

  private
  def not_a_tie
    # raise "Ends in a tie" if game_is_finished? && hasWon? == false
    errors.add :game, "has ended in a tie" if game.game_is_finished? && game.hasWon? == false
  end

  private
  def player_is_playing_game
    # raise "Incorrect user" unless [ user1_id, user2_id ].include?(user.id)
    errors.add :user_id, "is not playing this game" unless [ game.user1_id, game.user2_id ].include?(user_id)
  end

  private
  def is_players_turn
      # raise "Wrong turn" unless whose_turn == user
    errors.add :base, "It is not this player's turn" unless game.whose_turn == user
  end

  private
  def square_is_in_bounds
    # raise "Invalid position" unless position_in_bounds?(position)
    errors.add :position, "is invalid" unless game.position_in_bounds?(position)
  end

  private
  def square_is_not_occupied
    # raise "Position #{position} is occupied" if position_is_occupied?(position)
    errors.add :position, "#{position} is occupied" if game.position_is_occupied?(position)
  end


end
