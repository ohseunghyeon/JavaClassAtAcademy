package spring.mvc.bms.command;

import org.springframework.web.servlet.ModelAndView;

public class LoginFormHandler implements MCommand {

	@Override
	public String execute(ModelAndView mv) {
		return "login/loginForm";
	}
}
