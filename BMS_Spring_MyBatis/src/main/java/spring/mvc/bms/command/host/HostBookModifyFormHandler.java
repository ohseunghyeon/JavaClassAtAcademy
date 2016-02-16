package spring.mvc.bms.command.host;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bms.command.MCommand;
import spring.mvc.bms.dao.BookDao;
import spring.mvc.bms.dto.BookDataBean;

@Service("hostBookModifyFormHandler")
public class HostBookModifyFormHandler implements MCommand {

	@Autowired
	BookDao boodDao;
	
	@Override
	public String execute(ModelAndView mv) {
		Map<String, Object> map = mv.getModelMap(); // model을 Map으로 변환
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String book_code = request.getParameter("book_code");
		
		BookDataBean book = boodDao.aBook(book_code);
		mv.addObject("book", book);
		return "host/bookModifyForm";
	}
}
