Poker
=====

## About

Poker is a distributed CLI poker game to play with your friends! Start up the application, join your friends and start playing. No server is necessary, it runs in an all masterless design.

## Installation

#### Install erlang and elixir, for Mac users:

    brew install elixir

##### (Should just need the above, but if you have trouble, try also installing the following)

    brew install erlang
    brew install rebar

#### Clone the repository

    git clone git@github.com:mgwidmann/poker.git && cd poker

#### Run the tests to be sure you are all set up correctly

    mix test

#### Start up the application

    mix play

## Playing

#### When the application loads it will ask you for your name

    Please enter your name: Joe
    All commands start with a "/". To get the list of commands, type "/?" or "/help"
    joe@joes-imac>

##### Simply type in a unique identifier for your group

#### Join other players

Do the same as above in another terminal or another computer on the same network.

##### Type /join <computer_name> <computer_name2> ... to join your friends

    /join joe@joes-imac

#### Listing players

To see who is connected, just type /list

    /list
    joe@joes-imac

#### Chatting

You can talk to any other player by simply typing anything that doesn't start with a forward slash (/).

    joe@joes-imac> Hey man whats up?
    joe@joes-imac>
    ...
    joe@joes-imac: Hey man whats up?
    fred@joes-imac>

@TODO
