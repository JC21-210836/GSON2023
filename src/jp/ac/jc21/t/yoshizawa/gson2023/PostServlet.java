package jp.ac.jc21.t.yoshizawa.gson2023;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.ac.jc21.t.yoshizawa.gson2023.resultJson.ResultBody;

/**
 * Servlet implementation class PostServlet 
 */
@WebServlet("/post")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//		response.sendRedirect("/");
		HttpSession session = request.getSession();
		ArrayList<String> message = new ArrayList<>();
		message.add("こんにちは。今の気持ちを教えてください。");
		session.setAttribute("messageLog", message);

		request.setAttribute("MESSAGE", message);

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/post.jsp");
		rd.forward(request, response);
		//doPost(request, response);
	}

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
		
		// FORMから文字列取り出し
		Optional<String> key = Optional.ofNullable("2ca357bd4b5649b395599885497e0204");
		Optional<String> text = Optional.ofNullable(request.getParameter("text"));

		// getIntentsメソッドで、CLUにアクセスして結果をインスタンスで取り出す
		ResultBody result = null;
		try {
			result = clu2023.getIntents(key.orElse(""), text.orElse("特に何もない"));

		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		// JSPに送るために保存
		request.setAttribute("result", result);

		// JSPに遷移
		request.getRequestDispatcher("jsp/post.jsp").forward(request, response);

	}
	
	/*private String makeMessage(CLU result) {

		String message = "";
		TopScoringIntent topScoringIntent = result.getTopScoringIntent();
		String intent = "";
		if (topScoringIntent != null) {
			intent = topScoringIntent.getIntent();
		}
		switch (intent) {

		////////////////////////////////////////////////////////////////////////////////
		// 「電話する」だと思ったら
		////////////////////////////////////////////////////////////////////////////////
		case "callTo":
			message = getCallToMessage(result);
			break;
		////////////////////////////////////////////////////////////////////////////////
		// 「ピザを注文する」だと思ったら
		////////////////////////////////////////////////////////////////////////////////
		case "orderPizza":
			message = getOrderPizzaMessage();
			break;
		////////////////////////////////////////////////////////////////////////////////
		// 「テレビを点ける」だと思ったら
		////////////////////////////////////////////////////////////////////////////////
		case "TurnOnTheTV":
			message = getTurnOnTheTVMessage(result);
			break;
		////////////////////////////////////////////////////////////////////////////////
		// 「それ以外」だと思ったら
		////////////////////////////////////////////////////////////////////////////////
		case "None":
			message = getNoneMessage();
			break;
		}
		return message + "(" + String.format("%.3f", topScoringIntent.getScore() * 100) + "%)";
		
	////////////////////////////////////////////////////////////////////////////////
	// 「電話する」だと思ったら
	////////////////////////////////////////////////////////////////////////////////
	private String getCallToMessage(CLU result) {
		String message;
		if (result.getEntities().size() >= 1) {
			message = "はい。[" + result.getEntities().get(0).getEntity() + "]に電話をしてみます。";
		} else {
			message = "えーと、電話をしてみましょうか・・・誰に？";
		}
		return message;
	}

	////////////////////////////////////////////////////////////////////////////////
	// 「ピザを注文する」だと思ったら
	////////////////////////////////////////////////////////////////////////////////
	private String getOrderPizzaMessage() {
		String message;
		message = "わかりました。ピザを注文します";
		return message;
	}

	////////////////////////////////////////////////////////////////////////////////
	// 「テレビを点ける」だと思ったら
	////////////////////////////////////////////////////////////////////////////////
	private String getTurnOnTheTVMessage(CLU result) {
		String message;
		message = "そうですね。テレビを見ましょう";
		return message;
	}

	////////////////////////////////////////////////////////////////////////////////
	// 「それ以外」だと思ったら
	////////////////////////////////////////////////////////////////////////////////
	private String getNoneMessage() {
		String message;
		message = "ごめんなさい。ちょっとわからないです。";
		return message;
	}
	*/
}
