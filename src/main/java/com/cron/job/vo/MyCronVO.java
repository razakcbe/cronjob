package com.cron.job.vo;

import java.util.List;

public class MyCronVO {

	private int tabindex;

	private Integer minutes;

	private String isForEveryHour;

	private Integer everyHour;
	
	private Integer hour;
	
	private String isEveryDay;

	private Integer day;
	
	private Integer dayOfWeek;
	
	private Integer month;
	
	private String isEveryMonth;
	
	List<Integer> weekdays;
	
	private String jobname;
	
	public int getTabindex() {
		return tabindex;
	}

	public void setTabindex(int tabindex) {
		this.tabindex = tabindex;
	}

	public Integer getMinutes() {
		return minutes;
	}

	public void setMinutes(Integer minutes) {
		this.minutes = minutes;
	}

	public Integer getHour() {
		return hour;
	}

	public void setHour(Integer hour) {
		this.hour = hour;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public List<Integer> getWeekdays() {
		return weekdays;
	}

	public void setWeekdays(List<Integer> weekdays) {
		this.weekdays = weekdays;
	}

	public Integer getEveryHour() {
		return everyHour;
	}

	public void setEveryHour(Integer everyHour) {
		this.everyHour = everyHour;
	}

	public Integer getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(Integer dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getJobname() {
		return jobname;
	}

	public void setJobname(String jobname) {
		this.jobname = jobname;
	}

	public String getIsForEveryHour() {
		return isForEveryHour;
	}

	public void setIsForEveryHour(String isForEveryHour) {
		this.isForEveryHour = isForEveryHour;
	}

	public String getIsEveryMonth() {
		return isEveryMonth;
	}

	public String getIsEveryDay() {
		return isEveryDay;
	}

	public void setIsEveryDay(String isEveryDay) {
		this.isEveryDay = isEveryDay;
	}

	public void setIsEveryMonth(String isEveryMonth) {
		this.isEveryMonth = isEveryMonth;
	}

}
