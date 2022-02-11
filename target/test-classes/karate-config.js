function fn() {
	var config = {
		name: "Aniket",
		baseURL: "", 
		tokenID:'9d9da0f230fb27d1ae0d8bd2f3db63fce1478f9f219ad4ab7aab4c2ba98792e9'
	}
	
	/*function setenv(){
		var TestRunner = Java.type('com.test.runner.TestRunner');
		var jd = new TestRunner();
		return jd.setEnv();
	}*/

	var env = karate.env//setenv()
	karate.log("The value of env is: ", env);

	if(env == null){
		karate.log("Execution Started")
	}else if (env == 'reqres') {
		config.baseURL = "https://reqres.in/api"
	} else if (env == 'naveen') {
		config.baseURL = "https://reqres.in/api/dev"
	} else {
		config.baseURL = "https://reqres.in/api/default"
	}

	karate.configure("connectTimeout", 5000);
	karate.configure("readTimeout", 5000);

	return config;
}