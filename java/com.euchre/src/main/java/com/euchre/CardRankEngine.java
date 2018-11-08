package com.euchre;

import java.util.ArrayList;

public class CardRankEngine {
    private final String trump;
    private final String left;
    public CardRankEngine(String trump){
        this.trump = trump;
    }

    public ArrayList<Card> rankHand(ArrayList<Card> hand){
        ArrayList<Card> trumpCards = new ArrayList<>();
        //get get right (trump) jack
        Card trumpJack = hand.stream().filter(c -> c.getSuite().equals(this.trump)).filter(c -> c.getRank().equals("J")).findFirst().get();

        //get left jack
        ArrayList<Card> cards

    }

    private String determineLeft(){
        if(this.trump.equals("Clubs")){
            return "Spades";
        }
        if(this.trump.equals("Spades")){
            return "Clubs";
        }
        if(this.trump.equals("Diamonds")){
            return "Hearts";
        }
        return "Diamonds";
    }

}
