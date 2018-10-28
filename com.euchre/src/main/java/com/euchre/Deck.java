package com.euchre;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

public class Deck {
    private ArrayList<Card> cards;
    public Deck(){
        this.cards = new ArrayList<Card>();
        this.cards.add(new Card("A", "Hearts"));
        this.cards.add(new Card("A", "Diamonds"));
        this.cards.add(new Card("A", "Spades"));
        this.cards.add(new Card("A", "Clubs"));
        this.cards.add(new Card("K", "Hearts"));
        this.cards.add(new Card("K", "Diamonds"));
        this.cards.add(new Card("K", "Spades"));
        this.cards.add(new Card("K", "Clubs"));
        this.cards.add(new Card("Q", "Hearts"));
        this.cards.add(new Card("Q", "Diamonds"));
        this.cards.add(new Card("Q", "Spades"));
        this.cards.add(new Card("Q", "Clubs"));
        this.cards.add(new Card("J", "Hearts"));
        this.cards.add(new Card("J", "Diamonds"));
        this.cards.add(new Card("J", "Spades"));
        this.cards.add(new Card("J", "Clubs"));
        this.cards.add(new Card("10", "Hearts"));
        this.cards.add(new Card("10", "Diamonds"));
        this.cards.add(new Card("10", "Spades"));
        this.cards.add(new Card("10", "Clubs"));
        this.cards.add(new Card("9", "Hearts"));
        this.cards.add(new Card("9", "Diamonds"));
        this.cards.add(new Card("9", "Spades"));
        this.cards.add(new Card("9", "Clubs"));
        this.cards.add(new Card("8", "Hearts"));
        this.cards.add(new Card("8", "Diamonds"));
        this.cards.add(new Card("8", "Spades"));
        this.cards.add(new Card("8", "Clubs"));
    }

    public Deck init(){
        return this;
    }

    public Deck shuffle(){
        Collections.shuffle(this.cards);
        return this;
    }

    public Card deal(){
        Card c = cards.stream().findFirst().get();
        cards.remove(c);
        return c;
    }



}
