package hibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hibernate.model.ClientForm;
import hibernate.service.DaoService;

@Controller
public class DemoController {
	
	@Autowired
	private DaoService daoService;
	
	//   http://localhost:8080/esempio_spring/index/10
	@RequestMapping(value="/index/{idIndex}", method=RequestMethod.GET)
	public String getIndex(@PathVariable("idIndex") int id, Model m) {
				
		m.addAttribute("cod", id);
		
		return "index";
				
	}
	

	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String loadForm(@ModelAttribute ClientForm clientForm, Model m) {
		
		return "formClient";
	}
	
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public String saveForm(@ModelAttribute ClientForm clientForm, BindingResult res, Model m) {
			
		if(res.hasErrors()) {
			m.addAttribute(clientForm);
			
			return "formClient";
		}
		
		daoService.addUser(clientForm);
		
		//return "redirect:show";
		return "redirect:formClient";
	}
	
	@RequestMapping(value="/show", method={RequestMethod.GET,RequestMethod.POST})
	public String showClients(Model m) {
		
		List<ClientForm> list = daoService.loadUser();
		m.addAttribute("clientList",list);
		
		return "clients";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id, Model m) {
		
		daoService.deleteUser(id);
		return "redirect:/show";
				
	}
		
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable int id, Model m) {
		
		m.addAttribute("clientForm", daoService.findUser(id));
		return "formClient";
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String getHome() {
		return "home";
	}
}
