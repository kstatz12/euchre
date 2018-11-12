package com.euchre;

public class Card {
    private final int rank;
    private final String suite;

    public Card(int rank, String suite){
        this.rank = rank;
        this.suite = suite;
    }

    public String getSuite(){
        return this.suite;
    }

    public int getRank(){
        return this.rank;
    }
}
