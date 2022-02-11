package com.test.runner;





import com.intuit.karate.junit5.Karate;





public class TestRunner {
	String basePath = ".//src//test//java//Features//";
	@Karate.Test
	public Karate testUsers()
		{
			return Karate.run(basePath+"CreateandDelete.feature");
					
					//.karateEnv("reqres");
			
			//.path(".//src//test//java//Features//").karateEnv("qa");
		}
	
	
	
	
	
	
	
	
//	@Before
//	public void before() {
//		System.setProperty("karatEnv", "qa");
//	}
	
	
	public String setEnv() {
		System.out.println("Hello, setting env");
		return System.setProperty("karate.env", "reqres");
	}
}
