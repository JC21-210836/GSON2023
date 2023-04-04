package jp.ac.jc21.t.yoshizawa.gson2023;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// FORMから文字列取り出し
		Optional<String> key = Optional.ofNullable(request.getParameter("key"));
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
		request.getRequestDispatcher("/WEB-INF/jsp/post.jsp").forward(request, response);

	}

}
