package com.cron.job.vo;

import java.util.Date;


public class JobDetail {
	
	String jobName;
	
	Date executedTime;
	
	Date previousExecutedTime;
	
	Date nextFireTime;

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Date getExecutedTime() {
		return executedTime;
	}

	public void setExecutedTime(Date executedTime) {
		this.executedTime = executedTime;
	}

	public Date getPreviousExecutedTime() {
		return previousExecutedTime;
	}

	public void setPreviousExecutedTime(Date previousExecutedTime) {
		this.previousExecutedTime = previousExecutedTime;
	}

	public Date getNextFireTime() {
		return nextFireTime;
	}

	public void setNextFireTime(Date nextFireTime) {
		this.nextFireTime = nextFireTime;
	}
	
}
