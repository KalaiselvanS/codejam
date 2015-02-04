package com.mycom.galmerguid.engine;

import java.util.List;

import com.mycom.galmerguid.scanners.GalMerGuidScanner;

public class Executer implements Runnable {

	private String fileName;

	public Executer(String fileName) {
		this.fileName = fileName;
	}

	public void start() {
		Thread t = new Thread(this);
		t.start();
		try {
			t.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		try {
			System.out.format("====> Interpreter starts for the programe in the file %s !!! <====\n\n", fileName);
			GalMerGuidScanner scanner = new GalMerGuidScanner(
					new java.io.FileReader(fileName));
			scanner = new GalMerGuidScanner(new java.io.FileReader(fileName));
			while (!scanner.getZzAtEOF()) {
				int i = scanner.yylex();
			}
			System.out.format("====> Interpreter ends for the programe in the file %s !!! <====\n\n", fileName);
			System.out.println("====> The output is below !!! <====\n");
			List<QuestionStatement> allQuestions = Session.getAllQuestions();
			for (QuestionStatement questionStatement : allQuestions) {
//				int res = questionStatement.getResponseCode();
//				if (res != 1) {
				System.out.println(questionStatement.getResponse());
//				} else {
//					System.out.println("I have no idea what you are talking about");
//				}
			}
			System.out.println("====> Thanks!!! <====\n");
		} catch (java.io.FileNotFoundException e) {
			System.out.format("File not found : \"%s\"\n", fileName);
		} catch (java.io.IOException e) {
			System.out.format("IO error scanning file \"%s\"\n%s\n", fileName,
					e);
		} catch (Exception e) {
			System.out.format("Unexpected exception:\n");
			e.printStackTrace();
		}
	}
}
