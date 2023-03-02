package evaluation;

public class EvaluationDTO {

	int evaluationID;
	String userID;
	String contentName;
	String contentYear;
	String genreDivide;
	String contentDivide;
	String evaluationTitle;
	String evaluationContent;
	String totalScore;
	String performanceScore;
	String storyScore;
	String ostScore;
	String directionScore;
	String visualBeautyScore;
	int likeCount;
	
	
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getContentName() {
		return contentName;
	}
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}
	public String getContentYear() {
		return contentYear;
	}
	public void setContentYear(String contentYear) {
		this.contentYear = contentYear;
	}
	public String getGenreDivide() {
		return genreDivide;
	}
	public void setGenreDivide(String genreDivide) {
		this.genreDivide = genreDivide;
	}
	public String getContentDivide() {
		return contentDivide;
	}
	public void setContentDivide(String contentDivide) {
		this.contentDivide = contentDivide;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getPerformanceScore() {
		return performanceScore;
	}
	public void setPerformanceScore(String performanceScore) {
		this.performanceScore = performanceScore;
	}
	public String getStoryScore() {
		return storyScore;
	}
	public void setStoryScore(String storyScore) {
		this.storyScore = storyScore;
	}
	public String getOstScore() {
		return ostScore;
	}
	public void setOstScore(String ostScore) {
		this.ostScore = ostScore;
	}
	public String getDirectionScore() {
		return directionScore;
	}
	public void setDirectionScore(String directionScore) {
		this.directionScore = directionScore;
	}
	public String getVisualBeautyScore() {
		return visualBeautyScore;
	}
	public void setVisualBeautyScore(String visualBeautyScore) {
		this.visualBeautyScore = visualBeautyScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public EvaluationDTO() {
		
	}
	
	public EvaluationDTO(int evaluationID, String userID, String contentName, String contentYear, String genreDivide,
			String contentDivide, String evaluationTitle, String evaluationContent, String totalScore,
			String performanceScore, String storyScore, String ostScore, String directionScore,
			String visualBeautyScore, int likeCount) {
		super();
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.contentName = contentName;
		this.contentYear = contentYear;
		this.genreDivide = genreDivide;
		this.contentDivide = contentDivide;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.performanceScore = performanceScore;
		this.storyScore = storyScore;
		this.ostScore = ostScore;
		this.directionScore = directionScore;
		this.visualBeautyScore = visualBeautyScore;
		this.likeCount = likeCount;
	}
	
	
}
