package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.ast.SynchronizedStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.user.UserService;

//==> ȸ������ Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method ���� ����

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml ���� �Ұ�
	// ==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping("addPurchaseView")

	public String addPurchaseView(@ModelAttribute("purchase") Purchase purchase, @RequestParam("prodNo") int prodNo,
			Model model) throws Exception {

		System.out.println("addPurchaseView start..................");

		// product.setProTranCode(tranCode);
		Product product = productService.getProduct(prodNo);
		System.out.println("product..........." + product);

		purchase.setPurchaseProd(product);
		model.addAttribute(purchase);

		return "forward:/purchase/addPurchaseView.jsp";

	}

	@RequestMapping("addPurchase")
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, @RequestParam("prodNo") int prodNo,
			@RequestParam("buyerId") String buyerId, Model model) throws Exception {

		System.out.println("/addPurchase");

		// purchase.getPurchaseProd().setProTranCode(purchase.getTranCode());

		purchase.setBuyer(userService.getUser(buyerId));
		purchase.setPurchaseProd(productService.getProduct(prodNo));

		purchaseService.addPurchase(purchase);

		System.out.println(purchase.getTranNo());
		System.out.println(purchase);

		model.addAttribute("purchase", purchase);

		return "forward:/purchase/addPurchase.jsp";
	}

	@RequestMapping("getPurchase")
	public String getPurchase(@RequestParam("tranNo") int tranNo,  @RequestParam("prodNo") int prodNo,
			Model model) throws Exception {

		System.out.println("getPurchase");
		
		
		Product product = productService.getProduct(prodNo);
		Purchase purchase = purchaseService.getPurchase(tranNo);
	
		
		purchase.setPurchaseProd(product);
		
		System.out.println("Controller Purchase Check : " + purchase);
		model.addAttribute("purchase", purchase);

		return "forward:/purchase/getPurchase.jsp";

	}

	@RequestMapping("updatePurchaseView")
	public String updatePurchaseView(@RequestParam("tranNo") int tranNo, Model model) throws Exception {

		System.out.println("/updatePurchaseView");
		
		System.out.println("tranNo.....확인." + tranNo );
		

		Purchase purchase = purchaseService.getPurchase(tranNo);

		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}

	@RequestMapping("updatePurchase")
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase,
			HttpServletRequest request, Model model) throws Exception {

		System.out.println("/updatePurchase");
		
		
		purchase.setDivyDate(purchase.getDivyDate().replaceAll("-", ""));
		
		User user = (User) request.getSession().getAttribute("user");

		purchase.setBuyer(user);

		purchaseService.updatePurchase(purchase);
		model.addAttribute("purchase", purchase);

		System.out.println("purchase Check........ : " + purchase);

		return "forward:/purchase/updatePurchase.jsp";
	}

	@RequestMapping("listPurchase")
	public String getPurchaseList(@ModelAttribute("search") Search search, @ModelAttribute("page") Page page,
			HttpServletRequest request, Model model) throws Exception {

		System.out.println("/listPurchase");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		User user = (User) request.getSession().getAttribute("user");

		Map<String, Object> map = purchaseService.getPurchaseList(search, user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("ListProductAction :: " + resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/purchase/listPurchase.jsp?menu=search";
	}

	@RequestMapping("updateTranCode")
	public String updateTranCode(@ModelAttribute("purchase") Purchase purchase,
			@RequestParam("tranCode") String tranCode, @RequestParam("prodNo") int prodNo,
			@RequestParam("menu") String menu, Model model) throws Exception {

		System.out.println("/updateTranCode ............");
		System.out.println("tranCode check .......... " + tranCode);

		Product product = productService.getProduct(prodNo);
		
		purchase.setPurchaseProd(product);

		if (tranCode.equals("1")) {
			tranCode = "2  ";
			purchase.setTranCode(tranCode);
			purchaseService.updateTranCode(purchase);

		} else {
			tranCode = "3  ";
			purchase.setTranCode(tranCode);
			purchaseService.updateTranCode(purchase);
		}
		
		
		
		model.addAttribute("purchase", purchase);
		//model.addAttribute("product", product);

		if (menu.equals("manage")) {
			return "forward:/product/listProduct?menu=manage";
		} else {
			return "forward:/purchase/listPurchase";
		}

	}

}