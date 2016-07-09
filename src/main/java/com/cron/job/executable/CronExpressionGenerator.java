package com.cron.job.executable;

import static com.cronutils.model.field.expression.FieldExpressionFactory.always;
import static com.cronutils.model.field.expression.FieldExpressionFactory.and;
import static com.cronutils.model.field.expression.FieldExpressionFactory.every;
import static com.cronutils.model.field.expression.FieldExpressionFactory.on;
import static com.cronutils.model.field.expression.FieldExpressionFactory.questionMark;

import java.text.ParseException;
import java.util.List;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.cron.job.vo.MyCronVO;
import com.cronutils.builder.CronBuilder;
import com.cronutils.model.Cron;
import com.cronutils.model.CronType;
import com.cronutils.model.definition.CronDefinitionBuilder;
import com.cronutils.model.field.expression.FieldExpression;
import com.google.common.collect.Lists;

public class CronExpressionGenerator {

	private static final CronExpressionGenerator instance = new CronExpressionGenerator();
	private CronExpressionGenerator(){
	}
	public static CronExpressionGenerator getInstance(){
		return instance;
	}

	Scheduler scheduler = null;

	public Scheduler getScheduler() {
		return scheduler;
	}
	public void shutdown(JobKey jobkey) throws SchedulerException{
		if(scheduler.checkExists(jobkey)){
			scheduler.shutdown();	
		}
	}
	public void doTask(MyCronVO cronVO,String jobname) throws SchedulerException, ParseException{

		String cron = generateCronExpression(cronVO);

		System.out.println(cron);

		JobDetail job = JobBuilder.newJob(ExecuteCronJob.class)
				.withIdentity(jobname+" job", "cron").build();

		Trigger trigger = TriggerBuilder
				.newTrigger()
				.withIdentity(jobname+" trigger", "trigger")
				.withSchedule(
						CronScheduleBuilder.cronSchedule(cron))
				.build();


		//schedule it
		scheduler = new StdSchedulerFactory().getScheduler();
		scheduler.start();
		scheduler.scheduleJob(job, trigger);
	}

	private String generateCronExpression(MyCronVO cronVO)
	{
		Cron cron = null;
		FieldExpression secondExp = on(0);
		FieldExpression minutesExp =  always();
		FieldExpression hourExp = always();
		FieldExpression dayOfWeekExp = always();
		FieldExpression monthExp = always();
		FieldExpression dayOfMonthExp = questionMark();
		FieldExpression yearExp = always();


		switch (cronVO.getTabindex()) {
		case 1:
			if(cronVO.getMinutes() != null){
				minutesExp = every(cronVO.getMinutes());
			}
			break;

		case 2:
			if(cronVO.getIsForEveryHour().equals("true") && cronVO.getEveryHour() != null){
				hourExp = every(cronVO.getEveryHour());
				minutesExp = on(0);
				secondExp = on(0);
			}else if(cronVO.getIsForEveryHour().equals("false")){
				hourExp = on(cronVO.getHour());
				minutesExp = on(cronVO.getMinutes());
				secondExp = on(0);
			}
			break;

		case 3:
			if(cronVO.getIsEveryDay().equals("true"))
				dayOfMonthExp = every(cronVO.getDay());
			else
				dayOfMonthExp = on(cronVO.getDay());	
			hourExp = on(cronVO.getHour());
			minutesExp = on(cronVO.getMinutes());
			dayOfWeekExp = questionMark();
			break;

		case 4:
			dayOfWeekExp = on(cronVO.getDayOfWeek());
			hourExp = on(cronVO.getHour());
			minutesExp = on(cronVO.getMinutes());
			dayOfMonthExp = questionMark();
			break;

		case 5:
			if(cronVO.getIsEveryMonth().equals("true")){
				monthExp = every(cronVO.getMonth());
			}else{
				monthExp = on(cronVO.getMonth());
			}
			dayOfMonthExp = on(cronVO.getDay());
			hourExp = on(cronVO.getHour());
			minutesExp = on(cronVO.getMinutes());
			dayOfWeekExp = questionMark();
			break;

		case 6:
			List<FieldExpression> list = Lists.newArrayList();
			for(Integer day : cronVO.getWeekdays()){
				dayOfWeekExp = on(day);
				list.add(dayOfWeekExp);
			}
			dayOfWeekExp = and(list);
			hourExp = on(cronVO.getHour());
			minutesExp = on(cronVO.getMinutes());
			dayOfMonthExp = questionMark();
			break;

		default:
			break;
		}

		cron = CronBuilder.cron(CronDefinitionBuilder.instanceDefinitionFor(CronType.QUARTZ))
				.withYear(yearExp)
				.withDoM(dayOfMonthExp)
				.withMonth(monthExp)
				.withDoW(dayOfWeekExp)
				.withHour(hourExp)
				.withMinute(minutesExp)
				.withSecond(secondExp)
				.instance();

		return cron.asString();
	}
}
