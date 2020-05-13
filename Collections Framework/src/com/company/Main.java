package com.company;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Main {

    public static void main(String[] args) {

        ArrayList list = new ArrayList();
        list.add("1");
        list.add("2");
        list.add("3");
        list.add("4");
        list.add("5");

        Iterator it = list.iterator();
        while(it.hasNext()){
            Object obj = it.next();
            System.out.println(obj);
        }

        System.out.println(" == Set 으로 구현 ==" );

        Set s = new HashSet();
        s.add("1");
        s.add("2");
        s.add("3");
        s.add("4");
        s.add("5");


        Iterator it2 = s.iterator();
        while(it2.hasNext()){
            System.out.println(it2.next());
        }

    }
}
