package com.test;

import java.util.Scanner;


public class Main {
	public static void main(String[] args) {
		Scanner sc =new Scanner(System.in);
		
		while(sc.hasNextLine()){
			String text = sc.nextLine();
			
			if(!(text.isEmpty() || text.length()>100)){
				System.out.println(text);				
			}
		}	
	}
}
