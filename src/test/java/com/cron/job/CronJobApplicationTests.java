package com.cron.job;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.cron.job.executable.CronExpressionGenerator;
import com.cron.job.vo.MyCronVO;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = CronJobApplication.class)
@WebAppConfiguration
public class CronJobApplicationTests {

	@Test
	@Ignore
	public void contextLoads() {
		MyCronVO myCronVO = new MyCronVO();
		myCronVO.setTabindex(1);
		myCronVO.setMinutes(1);
		CronExpressionGenerator cronExpression = CronExpressionGenerator.getInstance();
		try{
			cronExpression.doTask(myCronVO,"razak");
			Thread.sleep(120000);
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

}
