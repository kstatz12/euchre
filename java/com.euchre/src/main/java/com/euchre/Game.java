package com.euchre;

import java.util.ArrayList;

public class Game {
    public Card dealOne(ArrayList<Card> deck){
        Card ret = deck[0];
        deck.remove(ret);
        return ret;
    }

    public ArrayList<Card> dealTwo(ArrayList<Card> deck){
        ArrayList<Card> ret = new ArrayList<>();
        ret.add(deck[0]);
        deck.remove(ret[0]);
    }
}
