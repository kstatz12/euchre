package com.euchre;

public class Card {
    private final String rank;
    private final String suite;

    public Card(String rank, String suite){
        this.rank = rank;
        this.suite = suite;
    }

    public String getSuite(){
        return this.suite;
    }

    public String getRank(){
        return this.rank;
    }
}
