package com.problems;

// Java code for Bridge and Torch problem
/**
*	A bridge will collapse in 15 minutes.
*	
*	4 people want to cross bridge before it will collapse. It is a dark night and there is only one torch between them.
*	
*	Only two people can cross at a time.
*	
*	"A" takes a minute to cross.
*	"B" takes 2 minutes.
*	"C" takes 5
*	and "D" takes 8 minutes
*	How do they all cross before the bridge collapses?
*	
*	A + B = 2 ->
*	B     = 2 <-
*	C + D = 8 ->
*	A     = 1 <-
*	A + B = 2 ->
*/
import java.util.*;
import static com.problems.BridgeAndTorch.Person.getPerson;

class BridgeAndTorch {

	public static final class Person implements Comparable<Person> {
		int time;
		String name;
		public static Person getPerson(int time, String name) {
			Person thiz = new Person();
			thiz.time = time;
			thiz.name = name;
			return thiz;
		}
		public int getTime() {
			return time;
		}
		public String getName() {
			return name;
		}
		@Override
		public int compareTo(Person o) {
			return time - o.time;
		}
		@Override
		public String toString() {
			return name+"-"+time;
		}
	}

	public static void main(String[] args) {
		ArrayList<Person> source = new ArrayList<>(Arrays.asList(
				getPerson(1, "A"),
				getPerson(2, "B"),
				getPerson(5, "C"),
				getPerson(8, "D"),
				getPerson(9, "E")
				));
		ArrayList<Person> target = new ArrayList<>();
		int tot = solveBridgeAndTorch(source, target);
		System.out.println("Total time: " + tot);
	}

	private static int solveBridgeAndTorch(ArrayList<Person> source, ArrayList<Person> target) {
		if (source == null || source.size() < 2) {
			return 0;
		}
		Collections.sort(source);Collections.sort(target);
		System.out.println("source: " + source + " <=> target: " + target);
		Person one = null;
		Person two = null;
		int last = source.size()-1;
		if (target.size() > 0 && source.size() > 2 &&
			(source.get(last).getTime() + target.get(0).getTime() + target.get(0).getTime())
					< (source.get(last-1).getTime() + source.get(0).getTime() + source.get(last).getTime())
		){
				one = source.remove(last);
				two = source.remove(last - 1);
		} else {
			one = source.remove(0);
			two = source.remove(0);
		}
		int tot = Math.max(one.getTime(), two.getTime());
		System.out.println("\t"+one +" and "+ two + " are crossing in [ " +tot+ " ] mins.");
		if (source.isEmpty()) return tot;
		
		target.add(one);target.add(two);
		Collections.sort(target);
		one = target.remove(0);
		tot += one.getTime();
		System.out.println("\t"+ one + " is returning in [ " +one.getTime()+ " ] mins.");
		source.add(one);
		System.out.println("source: " + source + " <=> target: " + target);
		System.out.println("==============");
		tot += solveBridgeAndTorch(source, target);
		return tot;
	}
	
	private static int solveBridgeAndTorch1(ArrayList<Person> source, ArrayList<Person> target) {
		System.out.println("source: " + source + " <=> target: " + target);
		if (source == null || source.size() < 2) {
			return 0;
		}
		Collections.sort(source);
		Person two = source.remove(1);
		Person one = null;
		if (target.size() > 0 && source.size() > 1) {
			one = source.remove(1);
		} else {
			one = source.remove(0);
		}
		int tot = Math.max(one.getTime(), two.getTime());
		System.out.println("\t"+one +" and "+ two + " are crossing in [ " +tot+ " ] mins.");
		if (source.isEmpty()) return tot;
		
		target.add(one);target.add(two);
		Collections.sort(target);
		one = target.remove(0);
		tot += one.getTime();
		System.out.println("\t"+ one + " is returning in [ " +one.getTime()+ " ] mins.");
		source.add(one);
		
		tot += solveBridgeAndTorch(source, target);
		return tot;
	}
}
