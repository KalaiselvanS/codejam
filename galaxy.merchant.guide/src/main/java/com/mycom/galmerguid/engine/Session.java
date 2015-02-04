package com.mycom.galmerguid.engine;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Session {

	private final Map<String, GalaxyNumber> galaxyNumbers = new HashMap<String, GalaxyNumber>();
	private final Map<String, Earning> allEarnings = new HashMap<String, Earning>();
	private final List<QuestionStatement> allQuestions = new ArrayList<QuestionStatement>();

	private static final ThreadLocal<Session> sessionHolder = new ThreadLocal<Session>() {
		@Override
		protected Session initialValue() {
			return new Session();
		}
	};

	public static Session context() {
		return sessionHolder.get();
	}

	public static void addQuestion(QuestionStatement questionStatement) {
		context().allQuestions.add(questionStatement);
	}

	public static boolean hasEarning(String nameOfEarning) {
		return context().allEarnings.containsKey(nameOfEarning);
	}

	public static Earning getEarning(String nameOfEarning) {
		return context().allEarnings.get(nameOfEarning);
	}

	public static Collection<GalaxyNumber> getAllGalaxyNumbers() {
		return context().galaxyNumbers.values();
	}

	public static GalaxyNumber getGalaxyNumber(String galaxySymbal) {
		return context().galaxyNumbers.get(galaxySymbal);
	}

	public static void addEarning(Earning earning) {
		context().allEarnings.put(earning.getName(), earning);
	}

	public static List<QuestionStatement> getAllQuestions() {
		return context().allQuestions;
	}

	public static void addGalaxyNumber(GalaxyNumber galaxyNumber) {
		context().galaxyNumbers.put(galaxyNumber.getGalaxySymbal(), galaxyNumber);
	}
}
