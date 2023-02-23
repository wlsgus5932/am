/***********************************************
* <pre>
* 업무구분명		:	date 관련 Util
* 세부업무구분명	: 	date 관련 Util
* 작성자 			: 	이진건
* 설명 				: 	date 관련 Util
* ----------------------------------------------
* 변경이력
* ----------------------------------------------
* NO 	날짜					작성자		내용
* 1		20150925				이진건		최초작성
* 
* </pre>
***********************************************/
package egovframework.aviation.mypage;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.SimpleTimeZone;
import java.util.TimeZone;
import java.util.Vector;

/**
 * Date, Time 관련 Util
 *
 * @see org.apache.commons.lang.time.DateUtils
 * @since 2008. 04. 02
 */
public class DateUtils {

	/** 
    *
    * 연-월-일 를 표시하기 위한 함수이다.
    *
    * @param formatstr formatstr 예 : "yyyy-MM-dd HH:mm:ss"
    * @param date Date, 오늘 날짜일 경우 date에 new java.util.Date() 를 넣어준다.
    * @return formatstr
	 */
	public static String getDateFormatStr(String formatstr, Date date) {
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(formatstr);
		String today= formatter.format(date);
		return(today);
	}
	
	
	/**
	 * 전달된 String ('yyyymmddhhmmss')을 날자 표시형식에 맞게 변환
	 * 
	 * @param String
	 *            str 변환시킬 문자열
	 * @param String
	 *            format 변환형식
	 * 
	 * @return String 변환된 문자열
	 */
	public static String dateFilter(String src, String format) {
		if (src == null || (format.length() < 1)) {
			return "";
		}

		String FmtStr, stryyyy, strmm, strdd, strhh, strmin, strss;
		int istrmm = 0;

		stryyyy = src.substring(0, 4);

		strmm = src.substring(4, 6);
		istrmm = Integer.parseInt(strmm);

		strdd = src.substring(6, 8);
		strhh = src.substring(8, 10);
		strmin = src.substring(10, 12);
		strss = src.substring(12, 14);

		char c = format.charAt(0);

		switch (c) {
		// YYYY/MM/DD
		case '0':
			FmtStr = stryyyy + "/" + strmm + "/" + strdd;
			break;

		// YYYY/MM/DD HH:mm:SS
		case '1':
			FmtStr = stryyyy + "/" + strmm + "/" + strdd + " " + strhh + ":"
					+ strmin + ":" + strss;
			break;

		// YYYY/MM/DD HH:mm
		case '2':
			FmtStr = stryyyy + "/" + strmm + "/" + strdd + " " + strhh + ":"
					+ strmin;
			break;

		// YY/MM/DD
		case '3':
			FmtStr = stryyyy.substring(2, 4) + "/" + strmm + "/" + strdd;
			break;

		// YY/MM/DD HH:mm
		case '4':
			FmtStr = stryyyy.substring(2, 4) + "/" + strmm + "/" + strdd + " "
					+ strhh + ":" + strmin;
			break;

		// YYYY-MM-DD
		case '5':
			FmtStr = stryyyy + "-" + strmm + "-" + strdd;
			break;

		// YYYY-MM-DD HH:mm:SS
		case '6':
			FmtStr = stryyyy + "-" + strmm + "-" + strdd + " " + strhh + ":"
					+ strmin + ":" + strss;
			break;

		// YYYY-MM-DD HH:mm
		case '7':
			FmtStr = stryyyy + "-" + strmm + "-" + strdd + " " + strhh + ":"
					+ strmin;
			break;

		// YYYY.MM.DD
		case '8':
			FmtStr = stryyyy + "." + strmm + "." + strdd;
			break;

		// YYYY.MM.DD HH:mm:SS
		case '9':
			FmtStr = stryyyy + "." + strmm + "." + strdd + " " + strhh + ":"
					+ strmin + ":" + strss;
			break;

		// YYYY.MM.DD HH:mm
		case 'A':
			FmtStr = stryyyy + "." + strmm + "." + strdd + " " + strhh + ":"
					+ strmin;
			break;

		// YYYY년 MM월 DD일
		case 'B':
			FmtStr = stryyyy + "년" + strmm + "월" + strdd + "일";
			break;

		// YYYY년 MM월 DD일 HH시 mm분
		case 'C':
			FmtStr = stryyyy + "년" + strmm + "월" + strdd + "일" + " " + strhh
					+ "시" + strmin + "분";
			break;

		// MM/DD HH:mm
		case 'E':
			FmtStr = istrmm + "/" + strdd + " " + strhh + ":" + strmin;
			break;

		// MM월 DD일 HH:mm
		case 'F':
			FmtStr = istrmm + "월" + strdd + "일 " + strhh + ":" + strmin;
			break;

		// MM-DD
		case 'G':
			FmtStr = strmm + "-" + strdd;
			break;

		default:
			FmtStr = stryyyy + "/" + strmm + "/" + strdd;
		}

		return FmtStr;
	}
	
	/**
	* 현재 날짜를 yyyy년 MM월 dd일 HH시 mm분의 형태로 값을 얻어낸다.
	*
	* @return yyyy년 MM월 dd일 HH시 mm분의 형태로 바뀐 현재 시간값
	*/
	public static String getTime() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		return sdf.format(d);
	}


	/**
	* 현재 날짜를 입력받은 포맷의 형태로 변환하여 결과값을 리턴하도로 한다.
	* 예) format : yyyyMMddHHmmss --> 20031130124130 로 결과값 반환
	*/
	public static String getTime(String format) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(d);
	}

	/**
	* 현재 날짜를 yyyy/mm/dd까지의 형태로 추출해낸다.
	*
	* @return yyyy/mm/dd형태로 변경되된 문자열값
	*/
	public static String getCurrentDate(){
		return getCurrentDate("yyyyMMdd");
	}

	/**
	* 현재 날짜를 yyyy/mm/dd까지의 형태로 추출해낸다.
	*
	* @return yyyy/mm/dd형태로 변경되된 문자열값
	*/
	public static String getCurrentDate(String format){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(d);
	}

	/**
	 * 2007.04.24 추가 hsbang
	* 현재 월을 추출해낸다.
	*
	* @return mm형태로 변경되된 문자열값
	*/
	public static String getCurrentMonth(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		return sdf.format(d);
	}
	
	public static String getCurrentDay(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		return sdf.format(d);
	}

	public static String getThisMonth(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		return sdf.format(d);
	}
	
	/**
	* 현재 년도를 추출해낸다.
	*
	* @return yyyy형태로 변경되된 문자열값
	*/
	public static String getThisYear(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		return sdf.format(d);
	}

	/**
	* 현재 시간을 03:34 형태의 시/분으로 표시한다.
	*
	* @return hh:mm형태로 변경되된 문자열값
	*/
	public static String getCurrentTime(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
		return sdf.format(d);
	}
	
	/**
	* 현재 시간을 03 형태의 시으로 표시한다.
	*
	* @return hh형태로 변경되된 문자열값
	*/
	public static String getCurrentHour(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH");
		return sdf.format(d);
	}

	/**
	* 오늘을 기준으로 입력받은 날자의 날짜를 알아낸다
	*
	* @return yyyy/mm/dd형태로 변경되된 문자열값
	*/
	public static String getDayInterval(String format, int distance){
		Calendar cal = getCalendar();
		cal.add(Calendar.DATE , distance);
		Date d = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(d);
	}

	/**
	* 입력받은 날자의 날짜를 기준으로 해당일의 과거나 미래일을 알아낸다
	*
	* @return format형태로 변경되된 문자열값
	*/
	public static String getDayInterval(String dateString, String format, int distance){
		Calendar cal = getCalendar(dateString);
		cal.add(Calendar.DATE , distance);
		Date d = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(d);
	}
	
	public static String getYearInterval(String format, int distance){
		Calendar cal = getCalendar();
		cal.roll(Calendar.YEAR, distance);
		Date d = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(d);
	}

	/**
	* 오늘을 기준으로 어제의 날짜를 알아낸다
	*
	* @return yyyy/mm/dd형태로 변경되된 문자열값
	*/
	public static String getYesterday(){
		Calendar cal = getCalendar();
		cal.roll(Calendar.DATE, -1);
		Date d = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		return sdf.format(d);
	}

	/**
	* 현재 얻어낸 날짜의 마지막 달을 알아낸다.
	*
	* @return yyyy/mm형태로 변경되된 문자열값
	*/
	public static String getLastMonth(){
		Calendar cal = getCalendar();
		cal.roll(Calendar.MONTH, -1);
		Date d = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		return sdf.format(d);
	}

	/**
	* 주어진 시작일과 종료일에 사이의 값들을 문자형태의 배열로 만들어낸다.
	*
	* @param startDay 생성하고자 하는 값을 시작일
	* @param endDay 생성하고자 하는 값의 종료일
	* @return 시작일과 종료일사이의 날짜값들을 가진 문자열배열
	*/
	public static String[] getDates(String startDay, String endDay){
		Vector<String> v = new Vector<String>();
		v.addElement(startDay);
		Calendar cal = getCalendar();
		cal.setTime(string2Date(startDay));

		String nextDay = date2String(cal.getTime());

		while (!nextDay.equals(endDay)) {
			cal.add(Calendar.DATE, 1);
			nextDay = date2String(cal.getTime());
			v.addElement(nextDay);
		}

		String[] go = new String[v.size()];
		v.copyInto(go);
		return go;
	}

	/**
	* GMT기준시간중의 한국표준시를 반환한다.
	*
	* return GMT+09:00형태의 대한민국표준시
	*/
	public static Calendar getCalendar(){
		Calendar calendar = new GregorianCalendar(TimeZone.getTimeZone("GMT+09:00"), Locale.KOREA);
		calendar.setTime(new Date());
		return calendar;
	}

	/**
	* GMT기준시간중의 한국표준시를 반환한다.
	*
	* return GMT+09:00형태의 대한민국표준시
	*/
	public static Calendar getCalendar(String dateString){
		Calendar calendar = new GregorianCalendar( TimeZone.getTimeZone("GMT+09:00"),Locale.KOREA);
		calendar.setTime (string2Date(dateString, "yyyyMMdd"));

		return calendar;
	}

	/**
	* GMT기준시간중의 한국표준시를 반환한다.
	*
	* return GMT+09:00형태의 대한민국표준시
	*/
	public static Calendar getCalendar(String dateString, String format){
		Calendar calendar = new GregorianCalendar( TimeZone.getTimeZone("GMT+09:00"),Locale.KOREA);
		calendar.setTime (string2Date(dateString, format));

		return calendar;
	}

	/**
	* GMT기준시간중의 한국표준시를 반환한다.
	*
	* return GMT+09:00형태의 대한민국표준시
	*/
	public static Calendar getCalendar(int year, int month, int day){
		Calendar calendar = new GregorianCalendar( TimeZone.getTimeZone("GMT+09:00"),Locale.KOREA);
		calendar.set(year, month - 1, day);
		return calendar;
	}

	/**
	* GMT기준시간중의 한국표준시를 반환한다.
	*
	* return GMT+09:00형태의 대한민국표준시
	*/
	public static Calendar getCalendar(int[] dateArray){
		Calendar calendar = new GregorianCalendar( TimeZone.getTimeZone("GMT+09:00"),Locale.KOREA);
		calendar.set(dateArray[0], dateArray[1] - 1, dateArray[2]);
		return calendar;
	}

	/**
	* GMT기준시간중의 한국표준시를 반환한다.
	*
	* return GMT+09:00형태의 대한민국표준시
	*/
	public static Calendar getCalendar(Date date){
		Calendar calendar = new GregorianCalendar( TimeZone.getTimeZone("GMT+09:00"),Locale.KOREA);
		calendar.setTime(date);

		return calendar;
	}

	/**
	* 날짜형태의 데이터를 yyyy/mm/dd형태로 바꿔주는 메소드
	* Date -> String (2000/09/25)
	*
	* @param d 설정된 날짜표시형태로 변경할 date객체
	* @return yyyy/mm/dd형태로 변경되어진 문자열
	*/
	public static String date2String(java.util.Date d){
		return date2String(d, "yyyyMMdd");
	}

	/**
	* 날짜형태의 데이터를 사용자정의형태로 바꿔주는 메소드
	* Date -> String (2000/09/25)
	*
	* @param d 설정된 날짜표시형태로 변경할 date객체
	* @return yyyy/mm/dd형태로 변경되어진 문자열
	*/
	public static String date2String(java.util.Date d, String format){
		if(d == null) return "";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(d);
	}

	/**
	* 문자열 데이터를 yyyy/mm/dd형태의 Date형태의 객체로 바꾸어준다
	* String -> Date (2000/09/25)
	*
	* @param s Date형태로 만들게 될 yyyy/mm/dd형태의 문자열
	* @return yyyy/mm/dd형태로 변경되어진 Date객체
	*/
	public static java.util.Date string2Date(String s){
		return string2Date(s, "yyyyMMdd");
	}

	/**
	* 문자열 데이터를 사용자형태의 Date형태의 객체로 바꾸어준다
	* String -> Date (2000/09/25)
	*
	* @param s Date형태로 만들게 될 yyyy/mm/dd형태의 문자열
	* @return yyyy/mm/dd형태로 변경되어진 Date객체
	*/
	public static java.util.Date string2Date(String s, String format){
		java.util.Date d = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			d = sdf.parse(s, new ParsePosition(0));
		}
		catch (Exception e) {
			throw new RuntimeException("Date format not valid.");
		}
		return d;
	}

	/**
	 * 주어진 날짜형 문자를 날짜로 변환하여 원하는 포맷으로 변환합니다.
	 * @param s 날짜형 문자
	 * @param format 출력할 날짜 포멧
	 * @return 주어진 포멧으로 변환된 문자열
	 */
	public static String string2String(String s, String format){
		java.util.Date d = string2Date(s);
		return date2String(d, format);
	}

	/**
	 * 두 날짜 사이의 차이
	 *
	 *  @param startDate 시작 날짜
	 *  @param endDate  종료 날짜
	 *  @return long    날짜 차이
	 */
	public static long getDayDistance(String startDate, String endDate) throws Exception {
		return getDayDistance(startDate, endDate, null);
	}


	/**
	 * 두 날짜 사이의 차이
	 * @param startDate 시작 날짜
	 * @param endDate  종료 날짜
	 * @param format    날짜 형식
	 * @return long    날짜 차이
	 */
	public static long getDayDistance(String startDate, String endDate, String format) throws Exception {
		if (format == null)
			format = "yyyyMMdd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date sDate;
		Date eDate;
		long day2day = 0;
		try {
			sDate = sdf.parse(startDate);
			eDate = sdf.parse(endDate);
			day2day = (eDate.getTime() - sDate.getTime()) / (1000 * 60 * 60 * 24);
		}
		catch (Exception e) {
			throw new Exception("wrong format string");
		}

		return Math.abs(day2day);
	}
	
	/**
	 * 두 시간의 차이를 밀리세컨드로 반환
	 * @param startDate 시작 시간
	 * @param endDate 끝 시간
	 * @return
	 */
	public static long getDayDistanceByMS(Date startDate, Date endDate) {
		long day2day = 0;
		day2day = endDate.getTime() - startDate.getTime();

		return day2day;
	}

	/**
	 * 미국의 현재 시간
	 * @return
	 */
	public static String getUSTime() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(
			"EEE, d MMM yyyy HH:mm:ss z", Locale.US);
		sdf.setTimeZone( (new SimpleTimeZone(0, "GMT")));
		return sdf.format(d);
	}

	/**
	 * 주어진 날짜와 현재 시간의 차이를 일로 반환
	 * @param compareDate 비교할 날짜
	 * @return
	 * @author crusader(2007_0514_0245)
	 */
	public static int getTimeDiffDayFromCurrent(Date compareDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(compareDate);
		GregorianCalendar now = new GregorianCalendar();
		long mSec = compareTime(cal, now);
		int diffDay = (int)(mSec / 86400000);
		return diffDay;
	}

	/**
	 * 현재 시각 기준으로 시각 차이 구하기(주어진 시각 - 현재 시각)
	 * @param str "yyyy-MM-dd a hh:mm:ss" 포맷의 문자열로 주어진 비교할 시각
	 * @return "dd일 hh시간 mm분 ss초" 또는 "-(dd일 hh시간 mm분 ss초)"
	 */
	public static String getTimeDiffSecFromCurrent(String str) {
		 String t = "";
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		 try {
			Date date = format.parse(str);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			GregorianCalendar now = new GregorianCalendar();
			t = getTimeDiffSec(cal, now);
		 }
		 catch (ParseException ex) {
			 ex.printStackTrace();
		 }
		 return t;
	 }

	/**
	 * 현재 시각 기준으로 시각 차이 구하기(주어진 시각 - 현재 시각)
	 * @param cal 주어진 시각
	 * @return "dd일 hh시간 mm분 ss초 millised" 또는 "-(dd일 hh시간 mm분 ss초 millisec)"
	 */
	public static String getTimeDiffSecFromCurrent(Calendar cal) {
		 GregorianCalendar now = new GregorianCalendar();
		 return getTimeDiffSec(cal, now);
	 }


	/**
	 * 현재 시각 기준으로 시각 차이 구하기(주어진 시각 - 현재 시각)
	 * @param str "yyyy-MM-dd a hh:mm:ss" 포맷의 문자열로 주어진 비교할 시각
	 * @return "dd일 hh시간 mm분 ss초" 또는 "-(dd일 hh시간 mm분 ss초)"
	 */
	public static int compareTimeSecFromCurrent(String str) {
		 int t = 0;
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		 try {
			 Date date = format.parse("2003-03-03 오후 10:00:00");
			 Calendar cal = Calendar.getInstance();
			 cal.setTime(date);
			 GregorianCalendar now = new GregorianCalendar();
			 t = compareTimeSec(cal, now);
		 }
		 catch (ParseException ex) {
			 ex.printStackTrace();
		 }
		 return t;
	 }

	/**
	 * 현재 시각 기준으로 시각 차이 구하기(주어진 시각 - 현재 시각)
	 * @param str "yyyy-MM-dd a hh:mm:ss" 포맷의 문자열로 주어진 비교할 시각
	 * @param dateFormat 날짜의 포멧
	 * @return "dd일 hh시간 mm분 ss초" 또는 "-(dd일 hh시간 mm분 ss초)"
	 */
	public static int compareTimeSecFromCurrent(String str, String dateFormat) {
		 int t = 0;
		 SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		 try {
			 Date date = format.parse(str);
			 Calendar cal = Calendar.getInstance();
			 cal.setTime(date);
			 GregorianCalendar now = new GregorianCalendar();
			 t = compareTimeSec(cal, now);
		 }
		 catch (ParseException ex) {
			 ex.printStackTrace();
		 }
		 return t;
	 }

	/**
	 * 현재 시각 기준으로 시각 차이구하기(주어진 시각 - 현재 시각)
	 * @param cal 주어진 시각
	 * @return "dd일 hh시간 mm분 ss초 millised" 또는 "-(dd일 hh시간 mm분 ss초 millisec)"
	 */
	public static int compareTimeSecFromCurrent(Calendar cal) {
		 GregorianCalendar now = new GregorianCalendar();
		 return compareTimeSec(cal, now);
	 }

	/**
	 * 두 Calendar 사이의 시각 차이 구하기(cal1 - cal2)
	 * @param cal1 계산될 시각
	 * @param cal2 기준 시각
	 * @return "dd일 hh시간 mm분 ss초" 또는 "-(dd일 hh시간 mm분 ss초)"
	 */
	public static String getTimeDiffSec(Calendar cal1, Calendar cal2) {
		long t1 = cal1.getTimeInMillis();
		long t2 = cal2.getTimeInMillis();
		long elapsed = t1 - t2;
		int sign = 1;
		if (elapsed < 0L) {
			elapsed = -elapsed;
			sign = -1;
		}

		int tmp = (int)(elapsed / 1000L);
		//int millisec = (int) (elapsed % 1000L);
		int sec = tmp % 60;
		tmp /= 60;
		int mn = tmp % 60;
		tmp /= 60;
		int hr = tmp % 24;
		int dd = tmp / 24;

		String str = "";
		if (dd != 0)
			 str += dd + "일 ";
		if (hr != 0)
			 str += hr + "시간 ";
		if (mn != 0)
			 str += mn + "분 ";
		if (sec != 0)
			 str += sec + "초";
		if (str.endsWith(" "))       // Cut off the last one space ' ' if it exists.
			str = str.substring(0, str.length() - 1);
		if (sign < 0)
			str = "-(" + str + ")";
		return str;
	}

	/**
	 * 두 Calendar 사이의 시각 차이 구하기(cal1 - cal2)
	 * @param cal1 계산될 시각
	 * @param cal2 기준 시각
	 * @return "dd일 hh시간 mm분 ss초 millised" 또는 "-(dd일 hh시간 mm분 ss초 millisec)"
	 */
	public static String getTimeDiff(Calendar cal1, Calendar cal2) {
		long t1 = cal1.getTimeInMillis();
		long t2 = cal2.getTimeInMillis();
		long elapsed = t1 - t2;
		int sign = 1;
		if (elapsed < 0L) {
			elapsed = -elapsed;
			sign = -1;
		}

		int tmp = (int)(elapsed / 1000L);
		int millisec = (int) (elapsed % 1000L);
		int sec = tmp % 60;
		tmp /= 60;
		int mn = tmp % 60;
		tmp /= 60;
		int hr = tmp % 24;
		int dd = tmp / 24;

		String str = dd + "일 " + hr + "시간 " + mn + "분 " + sec + "초 " + millisec;
		if (sign < 0)
			str = "-(" + str + ")";
		return str;
	}

	/**
	 * 두 Calendar 사이의 시각 차이 구하기(cal1 - cal2)
	 * @param cal1 계산될 시각
	 * @param cal2 기준 시각
	 * @return 밀리세컨드
	 */
	public static long compareTime(Calendar cal1, Calendar cal2) {
		long t1 = cal1.getTimeInMillis();
		long t2 = cal2.getTimeInMillis();
		return t1 - t2;
	}

	/**
	 * 두 Calendar 사이의 시각 차이 구하기(cal1 - cal2)
	 * @param cal1 계산될 시각
	 * @param cal2 기준 시각
	 * @return 초
	 */
	public static int compareTimeSec(Calendar cal1, Calendar cal2) {
		long t1 = cal1.getTimeInMillis();
		long t2 = cal2.getTimeInMillis();
		long elapsed = t1 - t2;
		int sign = 1;
		if (elapsed < 0L) {
			elapsed = -elapsed;
			sign = -1;
		}
		return sign * (int)((elapsed + 500L) / 1000L);
	}
	
	/**
	 * 현재 시간과의 차이 구하기
	 * @param date 계산될 시각
	 * @return "dd일 hh시간 mm분 ss초 전" 또는 "dd일 hh시간 mm분 ss초 후"
	 */
	public static String getTimeDiffSecFromCurrent(Date date) {
		 GregorianCalendar now = new GregorianCalendar();
		 return getTimeDiffDay(getCalendar(date), now);
	}
	
	/**
	 * 두 Calendar 사이의 시각 차이 구하기(cal1 - cal2)
	 * @param cal1 계산될 시각
	 * @param cal2 기준 시각
	 * @return "dd일 hh시간 mm분 ss초 전" 또는 "dd일 hh시간 mm분 ss초 후"
	 */
	public static String getTimeDiffDay(Calendar cal1, Calendar cal2) {
		long t1 = cal1.getTimeInMillis();
		long t2 = cal2.getTimeInMillis();
		long elapsed = t1 - t2;
		int sign = 1;
		if (elapsed < 0L) {
			elapsed = -elapsed;
			sign = -1;
		}

		int tmp = (int)(elapsed / 1000L);
		//int millisec = (int) (elapsed % 1000L);
		int sec = tmp % 60;
		tmp /= 60;
		int mn = tmp % 60;
		tmp /= 60;
		int hr = tmp % 24;
		int dd = tmp / 24;

		String str = "";
		if (dd != 0)
			 str += dd + "일 "; 
		else if (hr != 0)
			 str += hr + "시간 ";
		else if (mn != 0)
			 str += mn + "분 ";
		else if (sec != 0)
			 str += sec + "초";
		
		if (str.endsWith(" "))       // Cut off the last one space ' ' if it exists.
			str = str.substring(0, str.length() - 1);
		if (sign < 0)
			str = str + "전";
		else
			str = str + "";
		return str;
	}
	
	/**
	 * 현재 시간과의 차이 구하기
	 * @param date 계산될 시각
	 * @return "dd일 hh시간 mm분 ss초 전" 또는 "dd일 hh시간 mm분 ss초 후"
	 */
	public static String getTimeDiffSecFromCurrent02(Date date) {
		 GregorianCalendar now = new GregorianCalendar();
		 return getTimeDiffDay02(getCalendar(date), now);
	}
	
	/**
	 * 두 Calendar 사이의 시각 차이 구하기(cal1 - cal2)
	 * @param cal1 계산될 시각
	 * @param cal2 기준 시각
	 * @return "dd일 hh시간 mm분 ss초 전" 또는 "dd일 hh시간 mm분 ss초 후"
	 */
	public static String getTimeDiffDay02(Calendar cal1, Calendar cal2) {
		long t1 = cal1.getTimeInMillis();
		long t2 = cal2.getTimeInMillis();
		long elapsed = t1 - t2;
		int sign = 1;
		if (elapsed < 0L) {
			elapsed = -elapsed;
			sign = -1;
		}

		int tmp = (int)(elapsed / 1000L);
		//int millisec = (int) (elapsed % 1000L);
		int sec = tmp % 60;
		tmp /= 60;
		int mn = tmp % 60;
		tmp /= 60;
		int hr = tmp % 24;
		int dd = tmp / 24;

		String str = "";
		if (dd != 0)
			 str += dd + "일 "; 
		if (hr != 0)
			 str += hr + "시간 ";
		if (mn != 0)
			 str += mn + "분 ";
		else if (sec != 0)
			 str += sec + "초";
		
		if (str.endsWith(" "))       // Cut off the last one space ' ' if it exists.
			str = str.substring(0, str.length() - 1);
		if (sign < 0)
			str = str + "전";
		else
			str = str + "";
		
		if(sign == -1){
			str = "end";
		}
		return str;
	}	
	
	/**
	 * 해당 주의 날짜 구하기
	 * @param year 년도
	 * @param week 해당 년의 주(1~53(54))
	 * @param i 요일(1: 월요일, 7:일요일)
	 * @return
	 */
	public static Date getDateByWeek(int year, int week, int i){
		Calendar c = Calendar.getInstance();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.set(java.util.Calendar.YEAR, year);
		c.set(java.util.Calendar.WEEK_OF_YEAR, week);
		c.set(java.util.Calendar.DAY_OF_WEEK, i);

		return c.getTime();
	}

	/**
	 * 해당 주의 시작일 구하기
	 * @param year 년도
	 * @param week 해당 년의 주(1~53(54))
	 * @return 해당 주의 시작일
	 */
	public static Date getSDateByWeek(int year, int week){
		return getDateByWeek(year, week, Calendar.MONDAY);
	}

	/**
	 * 해당 주의 종료일 구하기
	 * @param year 년도
	 * @param week 해당 년의 주(1~53(54))
	 * @return 해당 주의 종료일
	 */
	public static Date getEDateByWeek(int year, int week){
		return getDateByWeek(year, week, Calendar.SUNDAY);
	}
	
	/**
	 * 해당 월의 마지막 일짜를 구합니다. 
	 * @param year 해당 년도
	 * @param month 해당 월
	 * @return
	 * @author crusader(2007_0521_1524)
	 */
	public static int getLastdayOfMonth(int year, int month) {
		GregorianCalendar cld = new GregorianCalendar ( year, month - 1, 1 );
		return cld.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 해당 월의 마지막 일짜를 구합니다. 
	 * @param year 해당 년도
	 * @param month 해당 월
	 * @return
	 * @author crusader(2007_0521_1524)
	 */
	public static int getLastdayOfMonth(String year, String month) {
		return getLastdayOfMonth(Integer.valueOf(year), Integer.valueOf(month));
	}
	
	public static boolean isDateType(String dt){
		boolean dateValidity = true;
		try{
			DateFormat df = DateFormat.getDateInstance ( DateFormat.SHORT );
			df.setLenient(false);
			@SuppressWarnings("unused")
			Date dt2 = df.parse ( dt ); 
		}catch ( Exception e ) { 
			dateValidity = false; 
		}
		return dateValidity;
	}
	
	public static boolean checkDate(String str){
		boolean dateValidity = true;
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA); //20041102101244
		df.setLenient(false); // false 로 설정해야 엄밀한 해석을 함.
	
		try {
			@SuppressWarnings("unused")
			Date dt = df.parse(str);
		}
		catch(ParseException pe){
			dateValidity = false;
		}catch(IllegalArgumentException ae){
			dateValidity = false;
		}
		return dateValidity;
	}
	
	public static Calendar getDateDist(int dist,String format){
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, dist);
		return c;
	}
	
	/**
	 * 현재부터 입력받은 시간만큼 증가 또는 감소한 날짜 구하기  
	 * @param field 시간 단위 필드
	 * @param amount 증가 또는 감소 시간
	 * @return 증가 또는 감소된 날짜
	 * @author sugu_present
	 */
	public static Date getCalculatedDate(int field, int amount) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(field, amount);
		
		return calendar.getTime();
	}

	/**
	 * 14자리의 입력받은 일시를 시간단위를 제외한 입력한 날짜 포맷으로 변환  
	 * @param date
	 * @param format (예:"yyyy-MM-dd")
	 * @return
	 */
	public static String getStringDateFormat(String date, String format) {
		if("".equals(date) || date == null){
			return "";
		}
		return string2String(date.substring(0, 8), format);
	}

	/**
	 * [설명]
     * 월을 더하거나 뺀다.
     * ex) String MM = doCalMonth('20120801','M', "yyyyMMdd");// 10개월 후
     *     String MM = doCalMonth('20120801',-10, "yyyyMMdd");// 20120801로 부터  10개월 전
     *
	 * @param strDate
	 * @param month
	 * @param pattern
	 * @return
	 */
    public static  String doCalMonth(String strDate,int month, String pattern) {
        return doCalTime('M', month, pattern,strDate);
    }
	    
    /**
     * 년을 더하거나 뺀다
     * @param strDate	기준일
     * @param year		더하거나 빼는 년수		
     * @param pattern	반환되는 패턴
     * @return
     */
    public static  String doCalYear(String strDate,int year, String pattern) {
        return doCalTime('y', year, pattern,strDate);
    }
	    
    /**
     * 일을 더하거나 뺀다.
     * @param strDate		기준일
     * @param day				더하거나 빼는 날수
     * @param pattern		반환되는 패턴
     * @return
     */
    public static  String doCalDay(String strDate,int day, String pattern) {
        return doCalTime('d', day, pattern,strDate);
    }
	    
    /**
     * [설명]
     * 년, 월, 일을 더하거나 뺀다.
     * ex) String yyyy = doCalTime('y', 10);// 10년 후
     *     String yyyy = doCalYear(-10);// 10년 전
     *     String mm = doCalMonth(10);// 10개월 후
     *     String mm = doCalTime('M', -10);// 10개월 전
     *     String dd = doCalTime('d', 10);// 10일 후
     *     String dd = doCalDate(-10);// 10일 전
     *
     * @param char type 년, 월, 일을 구분한다. 시, 분, 초, 1/100초까지 넣어둠
     * @param int time 더하고 뺄 기간을 숫자로 넣는다.
     * @return String pattern의 형태로 리턴한다.
     */
    public static  String doCalTime(char type, int time, String pattern, String strDate) {
       Calendar cal = getCalendar();
        cal.setTime(string2Date(strDate));
        switch(type) {
        case 'y':
            cal.add(cal.YEAR, time);
            break;
        case 'M':
            cal.add(cal.MONTH, time);
            break;
        case 'd':
            cal.add(cal.DATE, time);
            break;
        case 'H':
            cal.add(cal.HOUR, time);
            break;
        case 'm':
            cal.add(cal.MINUTE, time);
            break;
        case 's':
            cal.add(cal.SECOND, time);
            break;
        case 'S':
            cal.add(cal.MILLISECOND, time);
            break;
        default: break;
        }
        java.util.Date calDate = cal.getTime();
        java.sql.Date date = new java.sql.Date(calDate.getTime());
        String resultTime = null;

        if(pattern == null) {
            resultTime = date.toString();
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat(pattern);
            resultTime = fmt.format(date);
        }
        return resultTime;
    }
    
    /**  
     * 시분 사이에 ':'를 첨가한다. HHMM -> HH:MM
     * @return java.lang.String
     * @param str 시간(HHMM)
     */
    public static String dotTime(String str) {

        String temp=null;
        // Hjun edit.. 2000.11.1
        if (str==null){
            return "";
        }
        int len = str.length();

        if (len != 4){
            return str;
        }
        
        temp = str.substring(0,2) + ":" + str.substring(2,4);
            
        return  temp;
    }
    
    /**
	 * 날짜 "201401" 를 "2014년01월" 로 변경
	 * @param date
	 * @return
	 */
	public static String getDateYYYYmm(String date){
		
		if(date == null || date.length() != 6){
			return date;
		}
		
		String year = date.substring(0, 4);
		String month = date.substring(4, 6);
		
		return year + "년" + month + "월";
	}
	
	/**
	 * 날짜 "2014012413" 를 "2014년01월24일13시" 로 변경
	 * @param date
	 * @return
	 */
	public static String getDateYYYYmmDDhh(String date){
		
		if(date == null || date.length() != 10){
			return date;
		}
		
		String year = date.substring(0, 4);
		String month = date.substring(4, 6);
		String day = date.substring(6, 8);
		String hour = date.substring(8, 10);
		
		return year + "년" + month + "월" + day + "일" + hour + "시";
	}
	
	/**
	 * Desc : 문자열 초를 시간 문자열로 변환
	 * ex) "-28800.0초" --> -8.0시간
	 * @param second
	 * @return
	 */
	public	static	String	secondToHour(String second){
		//String a="-28800.0";//--초
		Double	time;//--시
		time=(Double.valueOf(second))/60/60;
		//System.out.println(c+"시");		
		return String.valueOf(time.intValue());
	}
	
	public static String getCurrentDateTime() {
		System.setProperty("user.timezone", "Asia/Seoul");
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyyMMddHHmmss";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern,
				currentLocale);
		return formatter.format(today);
	}
	
	public static String getCurrentDateStr() {
		return getCurrentDateTime().substring(0, 8);
	}
	
	/**
     * 입력된 일자를 더한 날짜를 yyyyMMdd 형태로 변환 후 return.
     *
     *
     * @param yyyymmdd
     *            기준일자
     * @param addDay
     *            추가일
     * @return 연산된 일자
     * @see java.util.Calendar
     */
    public static String getDateAdd(String yyyymmdd, int addDay) {
        Calendar cal = Calendar.getInstance(Locale.FRANCE);
        int new_yy = Integer.parseInt(yyyymmdd.substring(0, 4));
        int new_mm = Integer.parseInt(yyyymmdd.substring(4, 6));
        int new_dd = Integer.parseInt(yyyymmdd.substring(6, 8));

        cal.set(new_yy, new_mm - 1, new_dd);
        cal.add(Calendar.DATE, addDay);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
       
        return sdf.format(cal.getTime());
    }
    
    /**
     * 입력된 일자를 더한 날짜를 yyyyMMdd 형태로 변환 후 return.
     *
     *
     * @param yyyymmdd
     *            기준일자
     * @param addDay
     *            추가일
     * @return 연산된 일자
     * @see java.util.Calendar
     */
    public static String getDateAdd(String yyyymmdd, int addDay, String format) {
        Calendar cal = Calendar.getInstance(Locale.FRANCE);
        int new_yy = Integer.parseInt(yyyymmdd.substring(0, 4));
        int new_mm = Integer.parseInt(yyyymmdd.substring(4, 6));
        int new_dd = Integer.parseInt(yyyymmdd.substring(6, 8));

        cal.set(new_yy, new_mm - 1, new_dd);
        cal.add(Calendar.DATE, addDay);

        SimpleDateFormat sdf = new SimpleDateFormat(format);
       
        return sdf.format(cal.getTime());
    }

    /**
     * 입력된 일자를 요일 형탤로 변환 후 return.
     * 
     * @param yyyymmdd
     * @return
     */
    public static String getDayOfWeek(String yyyymmdd) {
    	String ch_week = "";
    	Calendar cal = Calendar.getInstance();
    	
		cal.set( Integer.parseInt(yyyymmdd.substring(0, 4)), Integer.parseInt(yyyymmdd.substring(4, 6)) - 1, Integer.parseInt(yyyymmdd.substring(6, 8)) ) ;
		
		switch(cal.get(cal.DAY_OF_WEEK)){
			case Calendar.SUNDAY :    ch_week = "일" ; break ;
			case Calendar.MONDAY :    ch_week = "월" ; break ;
			case Calendar.TUESDAY :   ch_week = "화" ; break ;
			case Calendar.WEDNESDAY : ch_week = "수" ; break ;
			case Calendar.THURSDAY :  ch_week = "목" ; break ;
			case Calendar.FRIDAY :    ch_week = "금" ; break ;
			case Calendar.SATURDAY :  ch_week = "토" ; break ;
		}
		
    	return ch_week;
    }
    
    /**
     * 현재 날짜와 시간을 만분의 일초 단위까지 구한다.
     * 
     * @return
     */
    public static String getDateTimeMillion() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSSS");
		long time = System.currentTimeMillis();
		return sdf.format(new Date(time));
	}
    
    
    /**
     * 지정된 두 일자간의 차일수를 구해준다.
     * @param fromWeekday	시작 요일코드
     * @param toWeekday		마지막 요일코드
     * @return int[]		입력된 시작요일과 마지막요일의 사이의 요일코드 리스트 반환
     */
    public static List<Integer> getBetweenWeekday(int fromWeekday, int toWeekday){
    	int tmpWeekday = 0;
    	List<Integer> weekdays = null;
    	
    	try{
    		if( (7 >= fromWeekday && 7 >= toWeekday) 
    				|| (0 < fromWeekday && 0 < toWeekday) ){
        		weekdays = new ArrayList<Integer>();
        		
        		if(fromWeekday > toWeekday){
        			toWeekday += 7;
        		}
        		
        		while( fromWeekday <= toWeekday ){
        			tmpWeekday = fromWeekday++;
        			if( 7 < tmpWeekday ){
        				tmpWeekday -= 7;
        			}
        			
    				weekdays.add(tmpWeekday);
    			}
        	}
    	}catch(Exception e){
    		weekdays = null;
    	}
    	
    	return weekdays;
    }
    
    /**
     * 지정된 두 일자간의 차일수를 구해준다. 한해의 몇번째주
     * @param fromWeekday	시작 주코드
     * @param toWeekday		마지막 주코드
     * @return int[]		입력된 시작주와 마지막주의 사이의 주코드 리스트 반환
     */
    public static List<Integer> getBetweenWeekInYear(int fromWeekday, int toWeekday){
    	int tmpWeekday = 0;
    	List<Integer> weekdays = null;
    	
    	try{
    		if( (52 >= fromWeekday && 52 >= toWeekday) 
    				|| (0 < fromWeekday && 0 < toWeekday) ){
    			weekdays = new ArrayList<Integer>();
    			
    			if(fromWeekday > toWeekday){
    				toWeekday += 52;
    			}
    			
    			while( fromWeekday <= toWeekday ){
    				tmpWeekday = fromWeekday++;
    				if( 52 < tmpWeekday ){
    					tmpWeekday -= 52;
    				}
    				
    				weekdays.add(tmpWeekday);
    			}
    		}
    	}catch(Exception e){
    		weekdays = null;
    	}
    	
    	return weekdays;
    }
    
	/**
	 * 나이 계산 
	 * 
	 * @param birth	생년월일
     * @param gubun 만 나이 여부 (1 - 만 나이)
     * @return int	나이 반환
	 */
	public static int age(String birth, String gubun) throws Exception {
		int ret_age = 0;
		
		if( null != birth && 8 == birth.length() ){
			if( "1".equals(gubun) ){
				ret_age = ageBetween(birth, getTime("yyyyMMdd"), "yyyyMMdd");
			} else {
				ret_age = ageBetween(birth.substring(0, 4), getThisYear(), "yyyy") + 1;
			}
		}
		
		return ret_age;
	}

	/**
	 * 인자로 전달된 날짜의 년도 차이를 리턴한다.
	 * 
	 * @param  from date string
	 * @param  to date string
	 * @param format 날짜를 표현할 때 사용할 표현 포멧을 나타내는 문자열.
	 * @return 두 날짜 사이의 년도 차이를 리턴한다.
	 */
	public static int ageBetween(String from, String to, String format) throws Exception {
		return (int) (getDayDistance(from, to, format) / 365);
	}
}
