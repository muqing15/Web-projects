package AllTest;

import org.junit.Test;

import java.util.Random;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 17:24 2018/6/16
 * @Description:
 */

public class NumsTest {
    public static void main(String[] args) {
        Random rand = new Random();
        for (int i = 0; i < 100; i++) {
            int x = 1000 + rand.nextInt(9000);
            System.out.print(x + " ");
            if (x % 10 == 0) {
                System.out.println();
            }
        }

    }

    @Test
    public void s() {
        System.out.println("asd");
    }

}
