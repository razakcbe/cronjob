<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Scheduler</title>
</head>
<script type="text/javascript" src="angular.js"></script>
<script type="text/javascript" src="angular-route.js"></script>
<script type="text/javascript" src="checklist-model.js"></script>
<script type="text/javascript" src="scripts.js"></script>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
<body ng-app="cronpage">

	<div
		style="border-bottom: 1px solid gray; border-top: 1px solid gray; text-align: center;">
		<h2>Job Scheduler</h2>
	</div>


	<form style="width: 100%" id="id1" method="post" action="">
		<input type="hidden" name="id1_hf_0" id="id1_hf_0" />

		<div class="tab-row">
			<ul>
				<li class="tab0"><a href="#/minutes"><span>Minutes</span></a></li>
				<li class="tab1">
					<!--  <a href="#/hourly" <span>Hourly</span> </a> --> <a
					href="#/hourly"><span>Hourly</span></a>
				</li>
				<li class="tab2 selected"><a href="#/daily"><span>Daily</span></a>
				</li>
				<li class="tab3"><a href="#/weekly"><span>Weekly</span></a></li>
				<li class="tab4"><a href="#/monthly"><span>Monthly</span></a></li>
				<li class="tab5"><a href="#/listjobs"><span>List all
							Jobs</span></a></li>
			</ul>
		</div>
		<div>
			<script type="text/ng-template" id="minutespage">
<table ng-controller="minuteController">
<tr>
<th>Job Type</th>
<td>Minutes</td>
</tr>
<tr>
<th>Minutes in Number</th>
<td>Every <input type="text" style="width: 40px" value="1" ng-model="mycronvo.minutes" /> 
			minute(s)
</td>
</tr>
<tr>
<th>Job Name :</th>
<td><input type="text" ng-model="mycronvo.jobname" /></td>
</tr>
<tr>
<td colspan = 2>
<button class="button" name="btnGenerate" id="idf" ng-click="schedule()">
					<strong> schedule </strong>
</button>
</td>
</tr>
</table>
</script>
			<script type="text/ng-template" id="hourlypage">
<table ng-controller="hourlyController">
<tr>
<th>Job Type</th>
<td>Minutes</td>
</tr>
<tr>
<th>Type of  Job</th>
<td>
<div>
	<input type="radio" id="newproduct" ng-model="mycronvo.isForEveryHour" value="true"> Every Hour
	<input type="radio" id="newproduct" ng-model="mycronvo.isForEveryHour" value="false"> Start On
</div>
</td>
<tr>
<th>Hour's in number(Every Hour)</th>
<td>Every <input type="text" style="width: 40px" value="1" ng-model="mycronvo.everyHour" /> 
			Hour(s)
</td>
</tr>
<tr>
<th>Select Hour and minutes(Start at)</th>
<td> <select name="hourPart" ng-model="mycronvo.hour">
<option value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option selected="selected" value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<select name="minutePart" ng-model="mycronvo.minutes">
<option selected="selected" value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
</tr>
<tr>
<th>Job Name :</th>
<td><input type="text" ng-model="mycronvo.jobname" /></td>
</tr>
<tr>
<td colspan = 2>
<button class="button" name="btnGenerate" id="idf" ng-click="schedule()">
					<strong> schedule </strong>
</button>
</td>
</tr>
</table>
</script>
			<script type="text/ng-template" id="dailypage">
<table ng-controller="dailyController">
<tr>
<th>Job Type</th>
<td>Daily</td>
</tr>
<tr>
<th>Type of  Job</th>
<td>
<div>
	<input type="radio" id="newproduct" ng-model="mycronvo.isEveryDay" value="true"> Every Day
	<input type="radio" id="newproduct" ng-model="mycronvo.isEveryDay" value="false"> Start On
</div>
</td>
</tr>
<tr>
<th>Day's in number(Every Day)</th>
<td>Every <input type="text" style="width: 40px" value="1" ng-model="mycronvo.day" /> 
			Hour(s)
</td>
</tr>
<tr>
<th>Select Hour and minutes(Start at)</th>
<td> <select name="hourPart" ng-model="mycronvo.hour">
<option value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option selected="selected" value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<select name="minutePart" ng-model="mycronvo.minutes">
<option selected="selected" value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
</tr>
<tr>
<th>Job Name :</th>
<td><input type="text" ng-model="mycronvo.jobname" /></td>
</tr>
<tr>
<td colspan = 2>
<button class="button" name="btnGenerate" id="idf" ng-click="schedule()">
					<strong> schedule </strong>
</button>
</td>
</tr>
</table>
</script>
			<script type="text/ng-template" id="weeklypage">
<table ng-controller="weeklyController">
<tr>
<th>Job Type</th>
<td>Weekly</td>
</tr>
<tr>
<th>Week day's </th>
<td>
<div>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="1">Sunday<br>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="2">Monday<br>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="3">Tuesday<br>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="4">Wednesday<br>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="5">Thursday<br>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="6">Friday<br>
	<input type="checkbox" checklist-model="mycronvo.weekdays" value="7">Saturday<br>
</div>
</td>
</tr>
<tr>
<th>Select Hour and minutes(Start at)</th>
<td> <select name="hourPart" ng-model="mycronvo.hour">
<option value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option selected="selected" value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<select name="minutePart" ng-model="mycronvo.minutes">
<option selected="selected" value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
</tr>
<tr>
<th>Job Name :</th>
<td><input type="text" ng-model="mycronvo.jobname" /></td>
</tr>
<tr>
<td colspan = 2>
<button class="button" name="btnGenerate" id="idf" ng-click="schedule()">
					<strong> schedule </strong>
</button>
</td>
</tr>
</table>
</script>
			<script type="text/ng-template" id="monthlypage">
<table ng-controller="monthlyController">
<tr>
<th>Job Type</th>
<td>Monthly</td>
</tr>
<tr>
<th>Type of  Job</th>
<td>
<div>
	<input type="radio" id="newproduct" ng-model="mycronvo.isEveryMonth" value="true"> Every Month
	<input type="radio" id="newproduct" ng-model="mycronvo.isEveryMonth" value="false"> Start On
</div>
</td>
</tr>
<tr>
<th>Day and month in number's</th>
<td> Day
				 <input type="text" style="width:40px" value="1" ng-model="mycronvo.day" />
				 of every
				 <input type="text" style="width:40px" value="1" ng-model="mycronvo.month" /> 
				 month(s)
</td>
</tr>
<tr>
<th>Select Hour and minutes(Start at)</th>
<td> <select name="hourPart" ng-model="mycronvo.hour">
<option value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option selected="selected" value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<select name="minutePart" ng-model="mycronvo.minutes">
<option selected="selected" value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
</tr>
<tr>
<th>Job Name :</th>
<td><input type="text" ng-model="mycronvo.jobname" /></td>
</tr>
<tr>
<td colspan = 2>
<button class="button" name="btnGenerate" id="idf" ng-click="schedule()">
					<strong> schedule </strong>
</button>
</td>
</tr>
</table>
</script>
<script type="text/ng-template" id="jobpage">
<table ng-controller="jobController">
<tr>
<th>Job Name</th>
<th>Previous Execution Time</th>
<th>Current Execution Time</th>
<th>Next Execution Time</th>
</tr>
<tr ng-repeat="jobdetail in jobdetails | orderBy:'jobName':false">
<td>{{jobdetail.jobName}}</td>
<td>{{jobdetail.previousExecutedTime | date : 'medium'}}</td>
<td>{{jobdetail.executedTime | date : 'medium'}}</td>
<td>{{jobdetail.nextFireTime | date : 'medium'}}</td>
</tr>
</table>
</script>
			<div ng-view></div>
		</div>
	</form>
</body>
</html>