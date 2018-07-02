package com.web.day01;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Ex01 {
	public static void main(String[] args) {
		String msg = "";
		File f =new File("./web/main.txt");
		FileReader fr = null;
		String st=null;
		BufferedReader br =null;
		try {
			fr = new FileReader(f);
			br = new BufferedReader(fr);
			while(true){
				st =br.readLine();
				if(st==null){break;}
				msg+=st+"\r\n";
			}
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(fr!=null){fr.close();}
				if(br!=null){br.close();}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		ServerSocket serv=null;
		Socket sock =null;
		OutputStream os =null;
		DataOutputStream dos =null;
		System.out.println("서버시작");
		try {
			serv=new ServerSocket(8080);
			while(true){
			System.out.println("접속대기");
			sock=serv.accept();
			System.out.println("접속중");
			os=sock.getOutputStream();
			dos = new DataOutputStream(os);
			byte[] temp =msg.getBytes("utf-8");
			dos.writeBytes("HTTP/1.1 200 OK \r\n");
			dos.writeBytes("Content-Type:text/html; charset=utf-8\r\n");
			dos.writeBytes("Content-Length:"+temp.length+"\r\n");
			dos.writeBytes("\r\n");
			dos.write(temp,0,temp.length);
			dos.writeBytes("\r\n");
			dos.flush();
			System.out.println("메시지전달");
			} 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			System.out.println("서버close");
			try {
				if(dos!=null)dos.close();
				if(os!=null)os.close();
				if(sock!=null)sock.close();
				if(serv!=null)serv.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
