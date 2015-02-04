package com.mycom.galmerguid.engine;

public class SyntaxError extends Error{

	public SyntaxError() {
	}

	public SyntaxError(String message, Throwable cause) {
		super(message, cause);
	}

	public SyntaxError(String message) {
		super(message);
	}

	public SyntaxError(Throwable cause) {
		super(cause);
	}
}
