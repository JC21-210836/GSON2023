package jp.ac.jc21.t.yoshizawa.gson2023.resultJson;

public class Entity {

	String category;
	String text;
	int offset;
	int length;
	float confidenceScore;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public float getConfidenceScore() {
		return confidenceScore;
	}
	public void setConfidenceScore(float confidenceScore) {
		this.confidenceScore = confidenceScore;
	}
	
	
}
