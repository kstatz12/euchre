package com.euchre;

import akka.actor.AbstractActor;

public class GameServer extends AbstractActor {

    private final Deck deck;
    public GameServer(){
        this.deck = new Deck();
    }
    @Override
    public Receive createReceive() {
        return receiveBuilder().match(StartGameMessage.class, sg ->{
        }).build();
    }
}
