package com.fengyukeji.questionnaire.utils;

import java.util.Random;

import org.junit.Test;

/**
 * 获取随机数
 * @author xt
 *
 * 2017年11月12日
 */
public class RadomUtil {
	@Test
	public  static String getRaddom(){
		Random random = new Random();
		String str1 = "abcdefghijklmnopqrstuvwxyz1234567890";
        String str2 = "";
        int len = str1.length() - 1;
        double r;
        for (int i = 0; i < 6; i++) {
            r = (Math.random()) * len;
            str2 = str2 + str1.charAt((int) r);
        }
		return str2;
	}
}
