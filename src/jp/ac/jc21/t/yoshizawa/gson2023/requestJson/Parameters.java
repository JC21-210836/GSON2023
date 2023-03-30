package jp.ac.jc21.t.yoshizawa.gson2023.requestJson;

public class Parameters {
	String projectName;
	String deploymentName;
	String stringIndexType;


	public Parameters(	String projectName,
	String deploymentName,
	String stringIndexType) {
		setProjectName(projectName);
		setDeploymentName(deploymentName);
		setStringIndexType(stringIndexType);

	}


	public String getProjectName() {
		return projectName;
	}



	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}



	public String getDeploymentName() {
		return deploymentName;
	}



	public void setDeploymentName(String deploymentName) {
		this.deploymentName = deploymentName;
	}



	public String getStringIndexType() {
		return stringIndexType;
	}



	public void setStringIndexType(String stringIndexType) {
		this.stringIndexType = stringIndexType;
	}




}
