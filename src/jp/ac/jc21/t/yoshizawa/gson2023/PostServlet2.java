package jp.ac.jc21.t.yoshizawa.gson2023;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.ac.jc21.t.yoshizawa.gson2023.resultJson.Entity;
import jp.ac.jc21.t.yoshizawa.gson2023.resultJson.ResultBody;

/**
 * Servlet implementation class PostServlet 
 */
@WebServlet("/post2")
public class PostServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

	/*  String message = "へんじがない";
		HttpSession session = request.getSession();
		ArrayList<String> messageLog = (ArrayList<String>) session.getAttribute("messageLog");
		if (messageLog == null) {
			messageLog = new ArrayList<String>();
		}
		String q = request.getParameter("q");

		try {
			Luis result = LuisTest01.getResult(q);
			message = makeMessage(result);
		} catch (URISyntaxException e) {
			e.printStackTrace();
			e.printStackTrace(response.getWriter());
		}

		messageLog.add(q);
		messageLog.add(message);
		session.setAttribute("messageLog", messageLog);

		request.setAttribute("MESSAGE", messageLog);

		RequestDispatcher rd = request.getRequestDispatcher("/AiSpeaker.jsp");
		rd.forward(request, response);
	*/
		
		// 保存されているか確認する
		HttpSession session = request.getSession();
		ArrayList<String> textLog = (ArrayList<String>) session.getAttribute("textLog");
		ArrayList<String> htmlLog = (ArrayList<String>) session.getAttribute("htmlLog");
		
		if ((textLog == null)||(htmlLog == null)) {
			textLog=new ArrayList<String>();
			htmlLog=new ArrayList<String>();
		}

		
		
		// FORMから文字列取り出し
		Optional<String> optText = Optional.ofNullable(request.getParameter("text"));
		
		String key="2ca357bd4b5649b395599885497e0204";
		String text=optText.orElse("特に何もない");

		// getIntentsメソッドで、CLUにアクセスして結果をインスタンスで取り出す
		ResultBody result = null;
		String html="すみません。お答えすることがありません";
		try {
			result = clu2023.getIntents(key, text);
			
			
			if(result.getResult().getPrediction().getTopIntent().equals("toEat")){
				html="";
				for (Entity es : result.getResult().getPrediction().getEntities()) {
			
					html+="<h3>"+es.getText()+"を食べよう！</h3>"+
							"<a href='https://www.google.com/search?q="+ es.getText() +
							"+%E3%81%8A%E3%81%99%E3%81%99%E3%82%81'>おいしい店を紹介します</a>";
				}
			}
			
			if(result.getResult().getPrediction().getTopIntent().equals("place")){
				html="";
				for (Entity es : result.getResult().getPrediction().getEntities()) {
					html+="<h3>"+ es.getText()+"に行こう！</h3>"+
							"<a href='https://www.google.com/search?q="+ es.getText()+
							"+%E3%80%80行き方'>行き方を紹介します</a>";
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}


		// やり取りを保存

		textLog.add(text);
		htmlLog.add(html);
		session.setAttribute("textLog",textLog);
		session.setAttribute("htmlLog",htmlLog);

		// JSPに送るために保存
		request.setAttribute("textLog", textLog);
		request.setAttribute("htmlLog", htmlLog);

		// JSPに遷移
		request.getRequestDispatcher("jsp/post2.jsp").forward(request, response);

	}
	
}
