package jp.ac.jc21.t.yoshizawa.gson2023.requestJson;

public class AnalysisInput {
	ConversationItem conversationItem;

	public AnalysisInput(String text) {
		setConversationItem( new ConversationItem(text));
	}

	public ConversationItem getConversationItem() {
		return conversationItem;
	}

	public void setConversationItem(ConversationItem conversationItem) {
		this.conversationItem = conversationItem;
	}


}
