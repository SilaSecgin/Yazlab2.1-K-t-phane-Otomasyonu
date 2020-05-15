package Controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class TesseractClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String test = "ISBN123- : 32 ";
		test = test.replace("ISBN", "");
		test = test.replace("-", "");
		test = test.replace(" ", "");
		test = test.replace(":", "");
		System.out.println(test);

	}

	private static void oku() {
		// TODO Auto-generated method stub
		BufferedReader reader;
		try {
			reader = new BufferedReader(
					new FileReader("C:/Users/silas/Documents/EclipseWorkspace/Connect/Images/out.txt"));
			String line = reader.readLine();
			while (line != null) {
				System.out.println(line);
				// read next line
				line = reader.readLine();
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void clearTxt() {
		// TODO Auto-generated method stub

		try {
			FileWriter fw = new FileWriter("C:/Users/silas/Documents/EclipseWorkspace/Connect/Images/out.txt");
			PrintWriter pw = new PrintWriter(fw);
			pw.print("");
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
