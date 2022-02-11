package com.test.runner;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.RandomStringUtils;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import com.intuit.karate.junit5.Karate;

public class APIUtils {
	
	public String generateRandomString(int count) {
		String randomString = RandomStringUtils.randomAlphabetic(count);
		return randomString; 
	}
	
	public String getDateTime() {
		String getDate = new SimpleDateFormat("dd-MM-yyyy-hh-mm-ss").format(new Date());
		System.out.println(getDate);
		return getDate;
	}
	
	public void allFeatureFilesRunner() {
		System.out.println("Hello");
		Builder<?> runner = new Builder<Builder>();
		runner.path("./src/test/java/Features");
		//Karate.run("CallScenarioAPI.feature").path(".//src//test//java//Features//");
	}
	
	public static void main(String[] args) {
		APIUtils util = new APIUtils();
		util.allFeatureFilesRunner();
	}
}
