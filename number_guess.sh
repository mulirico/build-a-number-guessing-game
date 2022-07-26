Last login: Tue Jul 26 20:21:31 on ttys000
vim
(base) murillo@MacBook-Air-de-Murillo ~ % vim





















#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

#number guess game

#ask for username
echo -e "Enter your username:"
read USERNAME

#criar variáveis para jogos jogados e melhor jogos PSQL
SEARCH_NAME=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME'")
SEARCH_NUMBER_GAMES=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN user_info USING (user_id) WHERE username ='$USERNAME';")
SEARCH_BEST_GAME=$($PSQL "SELECT MIN(n_tries) FROM games INNER JOIN user_info USING (user_id) WHERE username ='$USERNAME';")

if [[ $SEARCH_NAME ]]
  then
    echo -e "\nWelcome back, $USERNAME! You have played $SEARCH_NUMBER_GAMES games, and your best game took $SEARCH_BEST_GAME guesses."
  else

