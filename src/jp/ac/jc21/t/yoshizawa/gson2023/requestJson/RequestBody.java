package jp.ac.jc21.t.yoshizawa.gson2023.requestJson;

public class RequestBody {
	String kind;
	AnalysisInput analysisInput;
	Parameters parameters;

	
	public RequestBody(String text) {
		setKind("Conversation");
		setAnalysisInput(new AnalysisInput(text));
		setParameters(new Parameters("SENDAI-KANKO", "sendai-kanko", "TextElement_V8"));
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public AnalysisInput getAnalysisInput() {
		return analysisInput;
	}

	public void setAnalysisInput(AnalysisInput analysisInput) {
		this.analysisInput = analysisInput;
	}

	public Parameters getParameters() {
		return parameters;
	}

	public void setParameters(Parameters parameters) {
		this.parameters = parameters;
	}

}
