package com.review.action;

public class ActionForward {

	private String path;// �씠�룞寃쎈줈
	private boolean isRedirect; // �씠�룞諛⑹떇
	// true - sendRedirect(),
	// false - forward()
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
