package jp.ac.jc21.t.yoshizawa.gson2023.resultJson;

public class Prediction {
	String topIntent;
	String projectKind;
	Intent[] intents;
    Entity[] entities;
    
    
	public String getTopIntent() {
		return topIntent;
	}
	public void setTopIntent(String topIntent) {
		this.topIntent = topIntent;
	}
	public String getProjectKind() {
		return projectKind;
	}
	public void setProjectKind(String projectKind) {
		this.projectKind = projectKind;
	}
	public Intent[] getIntents() {
		return intents;
	}
	public void setIntents(Intent[] intents) {
		this.intents = intents;
	}
	public Entity[] getEntities() {
		return entities;
	}
	public void setEntities(Entity[] entities) {
		this.entities = entities;
	}

}
