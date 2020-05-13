package com.company;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Main {

    public static void main(String[] args) {
        Map<String, Double> productPrice = new HashMap<>();

        productPrice.put("Rice",6.9);
        productPrice.put("Flour",3.9);
        productPrice.put("Sugar",4.9);
        productPrice.put("Milk",3.9);
        productPrice.put("Egg",1.9);

        Double egg = productPrice.get("Egg");
        System.out.println("The price of Egg is : " + egg);


        Set<String> keys = productPrice.keySet();
        for(String key : keys)
            System.out.println(key);

        Collection<Double> values = productPrice.values();
        for(Double value : values)
            System.out.println(value);
    }
}

