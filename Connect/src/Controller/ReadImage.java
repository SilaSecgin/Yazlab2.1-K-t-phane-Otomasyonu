package Controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class ReadImage {
	public static void txtConvert(String paths) {
		// TODO Auto-generated method stub
		String path = "cmd /c start tesseract " + paths
				+ " C:\\Users\\silas\\Documents\\EclipseWorkspace\\Connect\\Images\\out";
		Runtime rn = Runtime.getRuntime();
		try {
			Process pr = rn.exec(path);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	static String line = null;

	public static String oku() {
		// TODO Auto-generated method stub
		BufferedReader reader;

		try {
			reader = new BufferedReader(
					new FileReader("C:/Users/silas/Documents/EclipseWorkspace/Connect/Images/out.txt"));
			line = reader.readLine();
			while (line != null) {
				System.out.println(line);
				line = line.replace("ISBN", "");
				line = line.replace("-", "");
				line = line.replace(" ", "");
				line = line.replace(":", "");
				return line;
			}

			reader.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return line;
	}

	private static String deneme(String line2) {
		// TODO Auto-generated method stub
		return null;
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
