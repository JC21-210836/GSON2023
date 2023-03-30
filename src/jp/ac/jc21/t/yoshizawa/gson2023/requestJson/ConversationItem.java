package jp.ac.jc21.t.yoshizawa.gson2023.requestJson;

public class ConversationItem {
	String id;
	String participantId;
	String text;


	public ConversationItem(String text) {
		setId("1");
		setParticipantId("1");
		setText(text);
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParticipantId() {
		return participantId;
	}
	public void setParticipantId(String participantId) {
		this.participantId = participantId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}
