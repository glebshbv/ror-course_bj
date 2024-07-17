
# Blackjack Game - Gleb Shabanov

## Overview

This is a simple command-line Blackjack game written in Ruby. The game simulates a Blackjack session where a player competes against a dealer. The game includes features like betting, handling multiple aces correctly, and determining the winner based on standard Blackjack rules.

## Features

- Player and dealer compete in a game of Blackjack.
- Betting system with a shared bank.
- Correct handling of multiple aces, including a special case for three aces.
- Game flow includes dealing initial hands, allowing the player to make moves, and determining the winner.
- Option to play multiple rounds.

## Project Structure

- **accountable.rb**: Module that includes methods for managing the balance and cards on hand.
- **player.rb**: Defines the Player class, including methods for placing bets and collecting winnings.
- **dealer.rb**: Defines the Dealer class, similar to the Player class but includes dealer-specific behavior.
- **card.rb**: Defines the Card class, including methods for determining card values.
- **bank.rb**: Manages the balance and tracks games played.
- **game.rb**: Manages the game flow, including setting up the game, handling player and dealer actions, and determining the winner.
- **program.rb**: Entry point for the game, responsible for initializing players, the dealer, the bank, and starting the game.

### How to Play

1. The game will automatically deal two cards each to the player and the dealer.
2. The player can choose to:
   - Check
   - Add a card
   - Flop cards (reveal cards and end the round)
3. The dealer will make decisions based on predefined rules.
4. The game will determine the winner based on the sum of the cards.
5. The player can choose to play another round or exit the game.

### Example Output


#### Request for action
```
Your hand is: | 6 ♠ | | 3 ♦ |
Please make your move. (1) Check (2) Add Card (3) Flop Cards
```

#### Revealing Cards
```
======================
| 10 ♣ | | Queen ♠ |
Player's hand sum: 20
======================
| Jack ♠ | | King ♥ |
Dealer's hand sum: 20
======================
It's a tie! Money is returned.
Do you want to play again? (y/n)
```

### Notes

- The sum of three aces is handled specially to equal 13 points.
- If the player's sum exceeds 21, they bust and lose the round.
- If both the player and the dealer have the same sum, it's a tie, and the bet is returned.
- Game automatically stops when both players reach 3 cards

## Credits

This project was completed as part of Ruby on Rails Course by Thinknetica

## License

This project is licensed under the MIT License.
