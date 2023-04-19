package jp.ac.jc21.t.yoshizawa.gson2023.resultJson;

import java.util.HashMap;
import java.util.Map;

public class TopScoringIntent {

	private String intent;
	private Float score;
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	public String getIntent() {
		return intent;
	}

	public void setIntent(String intent) {
		this.intent = intent;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}