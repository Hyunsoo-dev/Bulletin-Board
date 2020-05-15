import java.util.*;
import java.util.Comparator;

public class TreeMapEx1 {

    public static void main(String[] args) {

        String[] data = {"A" , "K" , "A" , "K" , "D" , "K" , "A" , "K" , "K" , "K" , "Z" , "D"};

        TreeMap map = new TreeMap();

        for(int i = 0; i < data.length; i++){

            if(map.containsKey(data[i])){
                Integer value = (Integer)map.get(data[i]);
                map.put(data[i] , new Integer(value.intValue()+1));
            }else
                map.put(data[i] , new Integer(1));

        }

        Iterator it = map.entrySet().iterator();

        System.out.println("= 기본정렬 =");
        while(it.hasNext()){
             Map.Entry entry = (Map.Entry)it.next();
             int value = ((Integer)entry.getValue()).intValue();
             System.out.println(entry.getKey() + " : " + printBar('#' , value) + " " + value);
        }

        System.out.println();

        //map 을 ArrayList 로 변환 후 Collections.sort 로 정렬
        Set set = map.entrySet();
        ArrayList list = new ArrayList(set);

        Collections.sort(list, new ValueComparator());

        it = list.iterator();
        System.out.println("= 값의 크기가 큰 순서로 정렬 =");

        while(it.hasNext()){
            Map.Entry entry = (Map.Entry)it.next();
            int value = ((Integer)entry.getValue()).intValue();
            System.out.println(entry.getKey() + " : " + printBar('#' , value) + " " + value);
        }
    }

    static class ValueComparator implements Comparator {

        public int compare(Object o1, Object o2){
            if(o1 instanceof Map.Entry && o2 instanceof Map.Entry){
                Map.Entry e1 = (Map.Entry)o1;
                Map.Entry e2 = (Map.Entry)o2;

                int v1 = ((Integer)e1.getValue()).intValue();
                int v2 = ((Integer)e2.getValue()).intValue();

                return v2 - v1;
            }
            return  -1;

        }

    }

    public static String printBar(char ch , int value){

        char[] bar = new char[ value ];

        for(int i = 0; i < bar.length; i++){
            bar[i] = ch;
        }

        return new String(bar);//new String(char[] value) -> 배열의 연속적인 값들을 나타내는 String 객체를 생성한다.
    }
}


