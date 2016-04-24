package by.topolev.twitter.web.controller;

import javax.validation.Valid;

import by.topolev.twitter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import by.topolev.twitter.domain.User;
import by.topolev.twitter.dao.UserDao;
@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "user/register", method = RequestMethod.GET)
	public String formRegister(Model model){
		User user = new User();
		model.addAttribute(user);
		return "user/register";
	}
	
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String userRegister(@Valid final User user, final BindingResult result){
		
		if (result.hasErrors()){
			return "user/register";
		}
		userService.create(user);
		return "redirect:/";
	}
	
	@RequestMapping(value="user/controlusername", method = RequestMethod.GET)
	@ResponseBody
	public String controlUsername(@RequestParam(value="username") String username){
		if (username.equals("leo")) return "yes";
		return "no";
	}
}
