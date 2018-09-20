package com.secureSoftwareDev.project.handler;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.StringJoiner;

import org.json.HTTP;
import org.json.JSONObject;

import com.secureSoftwareDev.project.model.User;

public class Connector {
	public JSONObject main (HttpURLConnection con) throws IOException {
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer content = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
				content.append(inputLine);
		}
		in.close();
		JSONObject myResponse = null;
		try {
			myResponse = new JSONObject(content);
			return myResponse;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public JSONObject login (Object pass) {
		String url = "http://212.47.229.155:3005/user/login";
		try {
			//return main(url, "POST", pass);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public JSONObject register (User pass) {
		String url = "http://212.47.229.155:3005/user/register";
		try {
			URL target = new URL(url);
			HttpURLConnection con = (HttpURLConnection) target.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setRequestProperty("userName", pass.getUserName());
			con.setRequestProperty("password", pass.getPassword());
			con.setRequestProperty("email", pass.geteMail());
			con.setRequestProperty("name", pass.getName());
			con.setRequestProperty("phonenumber", pass.getPhoneNumber());
			return main(con);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public JSONObject billing (Object pass) {
		String url = "http://212.47.229.155:3005/user/billing";
		try {
			//return main(url, "POST", pass);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public JSONObject getBooks () {
		String url = "http://212.47.229.155:3005/getBook";
		try {
			//return main(url, "GET", null);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
}
