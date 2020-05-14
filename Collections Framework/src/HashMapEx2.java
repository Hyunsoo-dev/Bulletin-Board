import java.util.*;


/*
 *
 *HashMap의 기본적인 메서드를 이용하여 데이터를 저장하고 읽어오는 예제이다.
 */
public class HashMapEx2 {

    public static void main(String[] args) {

            HashMap map = new HashMap();

            map.put("김자바" , new Integer(90));
            map.put("김자바" , new Integer(100));
            map.put("이자바" , new Integer(100));
            map.put("강자바" , new Integer(80));
            map.put("안자바" , new Integer(90));

            Set set = map.entrySet();

            Iterator it = set.iterator();

            while(it.hasNext()){
                Map.Entry e =(Map.Entry)it.next();
                System.out.println("이름 : " + e.getKey() + ", 점수 : " + e.getValue());
            }

            set = map.keySet();
            System.out.println("참가자 명단 : " + set);

            Collection values = map.values();
            //System.out.println("점수 : " + values);

            it = values.iterator();
            int total = 0;

            while(it.hasNext()){

                Integer i = (Integer)it.next();
                total += i.intValue();

            }

            System.out.println("총점 : " + total);
            System.out.println("평균 : " + total/set.size());
            System.out.println("최고 점수 : " + Collections.max(values));
            System.out.println("최저 점수 : " + Collections.min(values));
    }
}
