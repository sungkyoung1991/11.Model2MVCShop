package com.model2.mvc.web.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.reply.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	///Field
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	@Qualifier("productServiceImpl")
	private ProductService productService; 
		
	public ReplyController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public ModelAndView insertReply(@ModelAttribute Reply reply ) throws Exception{
		
		System.out.println("reply start..............................");
		
		
		Product product = new Product();
		//product.setReply(reply);
		
		replyService.insertReply((Reply) reply);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject(reply);
		
		return modelAndView;
		
		
		
	}
	

}
	
	
