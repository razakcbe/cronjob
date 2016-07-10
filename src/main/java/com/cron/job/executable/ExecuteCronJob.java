/**
 * 
 */
package com.cron.job.executable;

import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Logger;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;

import com.cron.job.config.CronDAO;
import com.cron.job.service.client.EmailClient;

/**
 * @author Abdul Razak
 *
 */
public class ExecuteCronJob implements Job {
	
	Logger log = Logger.getLogger(ExecuteCronJob.class.getName());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		log.info("Hello Quartz!"+new Date().toString());
		
		CronDAO jdbcConnection = CronDAO.getInstance();
		try {
			int count = jdbcConnection.selectRecordsFromTable(context.getJobDetail().getKey().getName());
			if(count >= 5 ){
				new EmailClient().sendEmail(context.getJobDetail().getKey().getName(),context.getFireTime());
				CronExpressionGenerator.getInstance().shutdown(context.getJobDetail().getKey());
			}else{
				jdbcConnection.insertRecordIntoDbUserTable(context.getJobDetail().getKey().getName(),context.getPreviousFireTime(),context.getFireTime(),context.getNextFireTime());
			}
		} catch (SQLException e) {
			log.severe("SQLException "+ e.getMessage());
		} catch (SchedulerException e) {
			log.severe("SchedulerException "+ e.getMessage());
		}
	}

}
