package by.topolev.twitter.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import by.topolev.twitter.domain.User;
@Controller
public class RegisterController {
	
	
	
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
		return "redirect:/";
	}
	
	@RequestMapping(value="user/controlusername", method = RequestMethod.GET)
	@ResponseBody
	public String controlUsername(@RequestParam(value="username") String username){
		if (username.equals("leo")) return "Username already exists";
		return "JKGJ";
	}
}
