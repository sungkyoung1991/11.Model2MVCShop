package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.reply.ReplyService;

//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method ���� ����
	
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;

	public ProductController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties ,
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product, 
									@RequestParam("file") MultipartFile file)
			throws Exception {

		System.out.println("/addProduct");
	
		if(file.getSize()>0){
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		String temDir ="/Users/gimseong-gyeong/git/11.Model2MVCShop/11.Model2MVCShop/WebContent/images/uploadFiles";
		File UploadedFile = new File(temDir, file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());
		file.transferTo(UploadedFile);
		ModelAndView modelAndView = new ModelAndView();
		productService.addProduct(product);
		modelAndView.setViewName("forward:/product/addProduct.jsp");
		modelAndView.addObject(product);
		return modelAndView;
		}else{
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
			ModelAndView modelAndView = new ModelAndView();
			productService.addProduct(product);
			modelAndView.setViewName("forward:/product/addProduct.jsp");
			modelAndView.addObject(product);
			return modelAndView;
			
		}
		
	}
	
//	@RequestMapping("getProduct")
//	public ModelAndView getProduct(@RequestParam("menu") String menu, 
//			@RequestParam("prodNo") int prodNo)
//			throws Exception {
//
//		System.out.println("/getProduct");
//		// Business Logic
//
//		Product product = productService.getProduct(prodNo);
//		
//		System.out.println("Controller Product Check : " + product);
//		System.out.println("menu check : " + menu);
//
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("product", product);
//		modelAndView.addObject("menu", menu);
//		// modelAndView.setViewName("forward:/product/getProduct.jsp");
//
//		if (menu.equals("manage")) {
//			modelAndView.setViewName("forward:/product/updateProductView.jsp");
//		} else {
//			modelAndView.setViewName("forward:/product/getProduct.jsp");
//		}
//
//		return modelAndView;
//	}
	
	@RequestMapping("getProduct")
	public ModelAndView getProduct(@RequestParam("menu") String menu, 
			@RequestParam("prodNo") int prodNo)
			throws Exception {

		System.out.println("/getProduct");
		// Business Logic

		Product product = productService.getProduct(prodNo);
		
		Map<String,Object> map = replyService.getReply(prodNo);
		
		
		
//		for(int i =0; i<reply.size(); i++)
//		product.setReply(reply.get(i));
		
		
		System.out.println("Controller Product Check : " + product);
		System.out.println("menu check : " + menu);
		
		System.out.println("product.reply~~~~~~~~~~~~~~~~~~ : " + product.getReply() );

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("product", product);
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("menu", menu);
		
		// modelAndView.setViewName("forward:/product/getProduct.jsp");

		if (menu.equals("manage")) {
			modelAndView.setViewName("forward:/product/updateProductView.jsp");
		} else {
			modelAndView.setViewName("forward:/product/getProduct.jsp");
		}

		return modelAndView;
	}


	@RequestMapping("updateProductView")
	public ModelAndView updateProductView(@RequestParam("prodNo") int prodNo) throws Exception {

		System.out.println("/updateProductView");

		Product product = productService.getProduct(prodNo);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/updateProductView.jsp");
		modelAndView.addObject("product", product);

		return modelAndView;
	}

//	@RequestMapping("updateProduct")
//	public ModelAndView updateProduct(@ModelAttribute("product") Product product, @RequestParam(value = "menu", required = false ) String menu)
//			throws Exception {
//
//		System.out.println("/updateProduct");
//		
//		product.setManuDate(product.getManuDate().replaceAll("-", ""));
//		
////		product.setFileName(file.getOriginalFilename());
//
//		productService.updateProduct(product);
//		System.out.println("updateProduct : " + product);
//
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("forward:/product/updateProduct.jsp");
//		modelAndView.addObject("product", product);
//		modelAndView.addObject("menu", menu);
//
//		return modelAndView;
//	}
	
	
	
	
	
	@RequestMapping("updateProduct")
	public ModelAndView updateProduct(@ModelAttribute("product") Product product, @RequestParam(value = "menu", required = false ) String menu,
			@RequestParam("file") MultipartFile file)
			throws Exception {
		
	if(file.getSize()>0){
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		String temDir ="/Users/gimseong-gyeong/git/11.Model2MVCShop/11.Model2MVCShop/WebContent/images/uploadFiles";
		File UploadedFile = new File(temDir, file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());
		file.transferTo(UploadedFile);
		ModelAndView modelAndView = new ModelAndView();
		productService.updateProduct(product);
		modelAndView.setViewName("forward:/product/updateProduct.jsp");
		modelAndView.addObject(product);
		return modelAndView;
		}else{
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
			ModelAndView modelAndView = new ModelAndView();
			productService.updateProduct(product);
			modelAndView.setViewName("forward:/product/updateProduct.jsp");
			modelAndView.addObject(product);
			return modelAndView;
			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping("listProduct")
	public ModelAndView getProductList(@ModelAttribute("search") Search search, @ModelAttribute("page") Page page)
			throws Exception {

		System.out.println("/listProduct");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("search", search);
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);

		modelAndView.setViewName("forward:/product/listProduct.jsp");

		return modelAndView;
	}
}