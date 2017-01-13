package com.pillars.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String Format(Date date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-dd-MM HH:mm:ss");
		return sdf.format(date);
	}

}
