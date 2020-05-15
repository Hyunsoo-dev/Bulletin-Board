import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import static java.util.Collections.*;
/*
 *
 * Collections 에서 제공하는 메소드 예제입니다.
 */

public class CollectionsEx {

    public static void main(String[] args) {


        List list = new ArrayList();
        System.out.println(list);

        addAll(list , 1,2,3,4,5); //addAll 은 static method 이기 때문에 Collections class 를 생성하지 않아도 사용할 수 있다.
        System.out.println(list);

        rotate(list , 2);
        System.out.println(list);

//        rotate(list, -2);
//        System.out.println(list);

        swap(list , 0 , 2);
        System.out.println(list);

        shuffle(list);
        System.out.println(list);

        sort(list);
        System.out.println(list);

        sort(list , reverseOrder());
        System.out.println(list);

        int idx = binarySearch(list , 3);
        System.out.println("idx of 3 = " + idx);

        System.out.println("max = " + max(list));
        System.out.println("min = " + min(list));
        System.out.println("min = " + max(list, reverseOrder()));

        fill(list , 9);
        System.out.println("list = "  + list);

        List newList = nCopies(list.size(), 2); // list.size() 만큼의 list를 생성하고 2로 채운다.
        System.out.println("newList = " + newList);


        System.out.println(disjoint(list , newList));

        copy(list , newList);
        System.out.println(" = newList 의 요소들을 List 로 옮긴 후 =");
        System.out.println(list);

        replaceAll(list , 2, 1);
        System.out.println(list);

        Enumeration e = enumeration(list);
        ArrayList list2 = list(e); //Returns an array list containing the element

        System.out.println(list2);

    }

}
