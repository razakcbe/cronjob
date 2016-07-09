package com.cron.job.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.quartz.SchedulerException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.cron.job.config.CronDAO;
import com.cron.job.executable.CronExpressionGenerator;
import com.cron.job.vo.JobDetail;
import com.cron.job.vo.MyCronVO;

@RestController
@RequestMapping(value="/cron")
public class CronController {

	@RequestMapping(value = "/start", method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public @ResponseBody ResponseEntity<String> fetchAllProduct(@RequestBody MyCronVO myCronVO) {
		CronExpressionGenerator cronExpression = CronExpressionGenerator.getInstance();
		try {
			cronExpression.doTask(myCronVO, myCronVO.getJobname());
		} catch (SchedulerException | ParseException e) {
			return new ResponseEntity<String>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<String>("Record Inserted", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public @ResponseBody ResponseEntity<List<JobDetail>> fetchAllProduct() {
		List<JobDetail> jobDetails;
		try {
			jobDetails = CronDAO.getInstance().selectRecordsFromTable();
			return new ResponseEntity<List<JobDetail>>(jobDetails, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<List<JobDetail>>(new ArrayList<JobDetail>(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
}
