package spring.mvc.board.Command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import spring.mvc.board.dao.BDao;
import spring.mvc.board.dao.IDao;
import spring.mvc.board.dto.BDto;

public class BContentFormCommand implements BCommand {

	@Override
	public String execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String number = request.getParameter("number");
		
		IDao dao = BDao.getInstance();
		BDto dto = dao.getArticle(num);
		
		// 내가 쓴 글이 아닌 것만 조회수 증가
		if (!request.getRemoteAddr().equals(dto.getIp())) {
			int result = dao.addCount(num);
			model.addAttribute("addReadCountResult", result);
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("dto", dto);
		
		
		return "board/contentForm";
	}

}
