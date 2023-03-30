package jp.ac.jc21.t.yoshizawa.gson2023;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;

import jp.ac.jc21.t.yoshizawa.WebApiConnector;
import jp.ac.jc21.t.yoshizawa.gson2023.requestJson.RequestBody;
import jp.ac.jc21.t.yoshizawa.gson2023.resultJson.ResultBody;

public class clu2023 {

	static ResultBody getIntents(String key,String text) throws IOException, URISyntaxException, InterruptedException {
		Gson gson = new Gson();

		String url = "https://clu2023.cognitiveservices.azure.com/"
		+"language/:analyze-conversations?api-version=2022-10-01-preview" ;
		Map<String, String> map = new HashMap<>();
		map.put("Ocp-Apim-Subscription-Key", key);

		RequestBody rBody = new RequestBody(text);

		String jsonData = new Gson().toJson(rBody);

		InetSocketAddress proxy = new InetSocketAddress("172.17.0.2", 80);
		JsonReader reader = WebApiConnector.postJsonReader(url, proxy, map, jsonData);

		ResultBody result = null;
		if (reader != null) {
			result = gson.fromJson(reader, ResultBody.class);
			reader.close();
		}
		return result;
	}

}
