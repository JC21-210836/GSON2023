package jp.ac.jc21.t.yoshizawa.gson2023.resultJson;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CLU {
	private String query;
	private TopScoringIntent topScoringIntent;
	private List<Intent> intents = null;
	private List<Entity> entities = null;
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	public String getQuery() {
	return query;
	}

	public void setQuery(String query) {
	this.query = query;
	}

	public TopScoringIntent getTopScoringIntent() {
	return topScoringIntent;
	}

	public void setTopScoringIntent(TopScoringIntent topScoringIntent) {
	this.topScoringIntent = topScoringIntent;
	}

	public List<Intent> getIntents() {
	return intents;
	}

	public void setIntents(List<Intent> intents) {
	this.intents = intents;
	}

	public List<Entity> getEntities() {
	return entities;
	}

	public void setEntities(List<Entity> entities) {
	this.entities = entities;
	}

	public Map<String, Object> getAdditionalProperties() {
	return this.additionalProperties;
	}

	public void setAdditionalProperty(String name, Object value) {
	this.additionalProperties.put(name, value);
	}

}